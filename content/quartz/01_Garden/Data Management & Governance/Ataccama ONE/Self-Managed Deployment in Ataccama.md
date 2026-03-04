- The automated deployment process aims to deploy a **customised Ataccama ONE Platform installation** onto **customer-provided infrastructure**.
- This installation includes:
    - Monitoring tools
    - Internal databases
    - All other necessary components for the platform to function
- Once installed, the platform can then be used to **process customer data**.
# Deployment Process: Key Stages
## 1. Preparation (Part 1)

- **Selecting optional components**.
- **Setting up target systems** for platform installation:
    - Operating system configuration.
    - Ansible access rights (requiring full administrative privileges).
    - Storage.
    - Backups.
- **Setting up network access**:
    - For the installation process.
    - User access.
    - Data source access.
- **Setting up wider infrastructure components**:
    - **DNS** (for user access and inter-server communication).
    - Mandatory **TLS certificates** (for user access).
## 2. Readiness Confirmation

- The customer and Ataccama jointly **review the infrastructure for completeness**.
- **Resolve any outstanding issues**.
- **Verify that sufficient access rights** have been granted for the installation.

## 3. Installation

- **Running the installation package**.
## 4. Verification

- **Accessing the user interface and monitoring system** to confirm that the platform is functioning as expected.
- This involves fixing any remaining issues and performing a demo of the new environment.

## 5. Handover

- The platform is **ready for use**.


Target State of Deployment: Criteria

    The expected outcome of the deployment process is a complete, ready-to-use installation of the Ataccama ONE Platform.
    It must meet the following criteria:
        It includes all selected optional components.
            The minimum installation currently comprises Ataccama ONE (Data Governance suite or Data Quality and Quality suite) and the observability stack (logging and monitoring tools), referred to as a standalone installation.
        It operates on the customer-provided hostname.
        It is connected to at least one customer data source.
        It can be accessed through the admin account.


Target State of Deployment: Monitoring & Essential Setup

    The monitoring solution delivered as part of the deployment includes:
        A Prometheus monitoring server equipped with preconfigured alerts.
        A Grafana server featuring preconfigured dashboards that display system performance data.
        An OpenSearch Dashboards log visualizer, which shows logs from all Ataccama components.
    Furthermore, the following elements must be set up:
        Backups: Handled by the customer.
        Firewalls: Must be configured on every target server using iptables or similar technology. Access should be restricted only to services configured during installation.


