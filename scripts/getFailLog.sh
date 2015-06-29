#!/bin/bash
#grep sshd AND Failed - in order
grep sshd.\*Failed /var/log/auth.log
