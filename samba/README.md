---
### SAMBA wiki:
 
Starting from version 4.0 (released in 2012,) Samba is able to serve as an Active Directory (AD) domain controller (DC). Samba operates at the forest functional level of Windows Server 2008 R2 which is more than sufficient to manage sophisticated enterprises that use Windows 10/11 with strict compliance requirements (including NIST 800-171.) While NIST 800-171 is designed specifically for non-Federal (commercial) enterprises, with a separate set of guidelines – NIST 800-57 – developed to cover Federal systems and organisations, ISO 27001 is a more general standard and can be applicable to organisations of all types. 

Installing RSAT tools to manage the DC and AD services frontend, its worth to mention DHCP won't connect to RSAT tools. RSAT is designed primarily for managing Windows services. While it can interact with some non-Windows services that use protocols compatible with Windows (like Samba for Active Directory), it generally does not support managing non-Windows implementations of DHCP directly. This is because the DHCP service in Linux (commonly ISC DHCP Server) does not communicate with the same management protocols as the Windows DHCP service. 

Security & Compliance Requirements: Many regulatory frameworks require detailed logs of access to sensitive data. Given that SYSVOL and NETLOGON can contain sensitive information, auditing these shares can help meet such compliance needs. Ensure that your Samba configuration aligns with any relevant compliance requirements (like GDPR, HIPAA, SOC2) especially in handling logging and user data. 

Do not create a symbolic link to the generated krb5.conf file. In Samba 4.7 and later, the /usr/local/samba/private/ directory is no longer accessible by other users than the root user. If the file is a symbolic link, other users are not able to read the file and, for example, dynamic DNS updates fail if you use the BIND_DLZ DNS back end. Make sure that you provision the AD using a DNS domain that will not need to be changed. Samba does not support renaming the AD DNS zone and Kerberos realm. Do not use .local for the TLD, this is used by Avahi. 

Samba AD is not compatible with other DNS servers, even if those that supports tkey-gss updates, because parts of Samba (like the DNS management RPC server and the domain join) assume the replicated DNS entries in the AD Database are the same as those exposed over DNS. Likewise the security of the system depends on the ACLs on each DNS entry in AD. LMDB (Lightning Memory-Mapped Database) library, which is necessary for Samba as an Active Directory Domain Controller and for running self-tests. Samba uses LMDB for storing certain types of data efficiently 

---
### Source Best Practice: 

When you extract source files directly to the root directory (/), it can lead to files being scattered across the system if the archive does not contain a top-level directory. This can make cleanup and management more difficult. Typically, it's better to extract source archives into a dedicated directory to keep your system organized and to avoid any unintended overwriting of system files or directories. A common practice is to use a directory like /usr/src or /opt for compiling software from source. This approach has several benefits: 

 
It keeps source files contained and easy to manage. 
It avoids cluttering the root directory or accidentally overwriting important system files. 
It makes it easier to delete or archive the source directory once you're done. 
This method provides a clean and reversible way to manage software compiled from source, which is especially helpful in environments where you might be compiling different versions or multiple software packages. 
