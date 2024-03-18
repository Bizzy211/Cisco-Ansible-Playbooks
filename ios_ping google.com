---
- name: Execute commands on Cisco Devices in Lab Network
  hosts: "Lab Network"
  gather_facts: no

  tasks:
    - name: Ping Google
      ios_command:
        commands: 
          - ping www.google.com
      register: command_output

    - name: Print command output
      debug:
        var: command_output.stdout_lines
