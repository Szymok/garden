---
raindrop_id: 677261778

---

# Metadata
Source URL:: https://www.technicznie-nietechniczne.pl/post/proxmox-trzy-w%C4%99z%C5%82y-dwa-wirtualne-hosty-i-jeden-klaster-cz%C4%99%C5%9B%C4%87-druga-part-2
Topics:: #proxmox, #hosting, #nas synology

---
# Proxmox - trzy węzły, dwa wirtualne hosty i jeden klaster - część druga. Proxmox klaster HA (part 2)

Konfiguracja klastra HA w scenariuszu 3 nody. Zobacz jak wykonać konfigurację środowiska HA dla twoich maszyn wirtualnych. Storage SMB, NFS

## Highlights
## Note
- The author describes their Proxmox cluster, consisting of three bare metal hosts and one Synology NAS, which serves as network storage for testing purposes. The cluster includes local storage in the form of LVM and LVM-Thin on the three nodes, as well as NFS and SMB storage accessible from the NAS with RAID 5. The storage options are visible at the cluster level. 

- The author explains the process of creating a directory on the partition devsda2 with the ext4 filesystem. The directory is named &quot;backup&quot; and is only accessible locally on the host. The same storage directory is created on pve02 and pve03 as well. The created storage directory is visible in the preview list where it was added. 

- The author demonstrates how to wipe disk data using the &quot;WIPE DISK&quot; option, cautioning that it will delete all partition information. They then proceed to configure their disk on the pve01 host, creating two partitions with capacities of 130 GB and approximately 100 GB. 

- The author mentions that the &quot;backup&quot; directory will be used as temporary backup storage for the host and can also store other types of content. This directory, like NFS and SMB, is visible throughout the cluster but is only accessible locally on each node. They also mention the creation of a ZFS storage, which requires operations on all hosts in the cluster. 