# OtterRoot (Fork) – CVE-2024-26809 Local Privilege Escalation

This is a custom fork of the [OtterRoot](https://github.com/otter-sec/OtterRoot/tree/master) exploit for CVE-2024-26809.

The original PoC failed to execute properly in my environment (Ubuntu 22.04.4 LTS). After adapting and debugging the exploit, I was able to gain root on the following kernel:

> ✅ **Tested and working on**  
> Ubuntu 22.04.4 LTS  
> Kernel: [`6.8.0-32-generic`](https://launchpad.net/ubuntu/+source/linux/6.8.0-32.32)
