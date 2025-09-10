# 💰 Wallets and Billing

## Overview

The Wallets &amp; Billing area provides a tenant-scoped ledger of credits and usage across Agents and their Services. Use it to review balances, audit transactions, export statements, and transfer credits within your tenant.

!!! info "Purpose"
    Use this view to understand where credits come from (Credits In), where they go (Credits Out), what was consumed (Credits Used), and how those movements reconcile to Opening and Closing Balances for each Agent and Service over a selected date range.

## Prerequisites

- Roles/permissions required:
    - Billing Roles, Administrator, or Owner.
- Access to the target tenant and its wallet via the “Select a Wallet” control.

!!! note "Access scope"
    Wallets are linked to Tenants. Each Tenant has a single main Wallet. Each Agent within a Tenant can be treated as a wallet endpoint for transfers (credits can be transferred to or from an Agent). Users with the appropriate roles across multiple Tenants will see and can switch between those Tenants’ wallets.

## Access and Navigation

1. Open Wallets &amp; Billing from the main navigation.
2. Use the “Select a Wallet” dropdown (top-right) to choose the Tenant wallet to view.
3. Adjust the date range at the top of the ledger to scope balances and transactions.
4. Use the search box and per-column filters to narrow the view.

![](../../assets/img-2025-09-10-14-15-09.png)

!!! tip "Quick navigation"
    - Use the per-column filter icons to quickly isolate specific Agents or values.
    - The search box (top-right of the grid) filters visible rows as you type.

## Wallet Summary

- Summary cards displayed:
    - **Opening Balance:** The balance at the start of the selected date range.
    - **Closing Balance:** The balance at the end of the selected date range.
    - **Credits In:** Credits transferred into the Agent or Service during the period.
    - **Credits Out:** Credits transferred out of the Agent or Service during the period.
    - **Credits Used:** Credits consumed by Services as they process transactions within the period.
    - **Total Transactions:** Count of service-level transactions in the period.

!!! example "Reading the cards"
    If you select a date range from the first day of a month to the last day of the month, “Opening Balance” reflects the balance at 00:00 on day one. “Closing Balance” reflects the balance just before 23:59:59 on the last day. Credits In, Credits Out, and Credits Used are the movements within that period and reconcile Opening → Closing for the scoped Agents/Services.

## Filters

- From Date and To Date
- Group Interval (e.g., 7/30/60 days) (Coming Soon)
- Show Deleted Projects/Services (Coming Soon)
- Show all related Transactions (Coming Soon)

!!! tip "Filtering effectively"
    - Start broad (entire month or quarter), then narrow to weeks or days using Group Interval to spot trends.
    - Use the refresh control after changing filters to ensure the ledger reflects the latest scope.

## Ledger by Agent

- Columns:
    - Agent
    - Opening Balance
    - Credits In
    - Credits Out
    - Credits Used
    - Closing Balance
- Per-column filtering and grouping
- Drill-down affordance to itemised bill

![](../../assets/img-2025-09-10-14-21-36.png)

Selecting an Agent row expands an itemised list of its Services and related movements for the selected period. Drag a column header to the “group” area to group by that column. Use the filter icon on each column to refine values.

!!! info "Real-time updates"
    Balances, transactions, and totals update in real-time as Services process documents and as credits are transferred.

## Itemised Bill (Service-level)

- Expand an Agent to view services.
- Columns:
    - Sequence Number ("#")
    - Service
    - Service Type
    - Info
    - Date
    - Number of Transactions
    - Credits In
    - Credits Out
    - Credits Used
    - Balance
- Nested services (if applicable) and how nesting affects totals.
- Link to Transaction Listing for the selected service.

![](../../assets/img-2025-09-10-14-21-47.png)

Services that orchestrate other steps may appear as nested entries (e.g., “Result Consolidation Pass (nested in …)”). Clicking a Service name opens the Transaction Listing scoped to that Agent + Service and the current date range.

!!! example "Interpreting a service row"
    A Service row with “Credits In: 0”, “Credits Out: 0”, and a positive “Credits Used” indicates pure consumption. Its “Balance” column contributes to reconciling the Agent’s Opening → Closing Balance, together with any Credits In/Out and Opening/Closing entries shown in the itemised bill.

## Transaction Listing

- Columns:
    - Date
    - Project
    - Service
    - Actioned User
    - Number Transactions
    - Usage
    - Deposit
- Footer totals (e.g., Total # Transactions, Total Usage, Total Credits In)
- How date range and filters propagate from the parent view.

![](../../assets/img-2025-09-10-14-21-58.png)

The Transaction Listing inherits the date range from the parent view. Use per-column filters and the global search to isolate specific transactions. The footer shows totals across the current listing.

!!! tip "Auditing trail"
    Filter by “Actioned User” to trace who triggered deposits or operational usage for investigative or audit purposes.

## Actions and Exports

- Export to PDF
- Export to Excel
- Transfer Credits (between wallets/agents)

![](../../assets/img-2025-09-10-14-22-20.png)

Use the action buttons (bottom-right of the page) to export the current view to PDF/Excel, or to initiate a credit transfer to or from an Agent.

!!! warning "Permissions required"
    Exports and credit transfers require Billing Roles, Administrator, or Owner. If you do not see the actions, verify your role assignments for the selected Tenant.

## Grouping, Search, and Columns

- Drag-to-group by any column.
- Per-column search and global search.
- Show/Hide columns menu.

The ledger supports drag-to-group and column filters. The Transaction Listing includes a “Columns” menu to show/hide fields for focused analysis.

!!! tip "Performance"
    For large tenants or long periods, narrow the date range and apply filters before grouping to improve loading and interactivity.

## Troubleshooting

- Missing or delayed transactions.
    - Check the selected date range and refresh. Verify whether “Show Deleted Projects/Services” is enabled when investigating older entries.
- Unexpected balances after transfers.
    - Confirm the direction and time of transfers and whether you are viewing the correct Tenant wallet and Agent.
- Time zone/date-range pitfalls.
    - Ensure the From/To timestamps match the period you intend to analyze across all views.
- Deleted projects/services visibility.
    - Toggle “Show Deleted Projects/Services” to include or exclude removed items in historical statements.

!!! danger "When to escalate"
    Escalate to support if:

    - A transfer or usage event is missing after you have refreshed and rechecked the correct Tenant wallet and date range.
    - Opening/Closing Balances fail to reconcile with visible Credits In/Out and Used for the same scope.
    - Exports are unavailable despite having the correct role.
    
    Include: Tenant name, Agent name, date range, screenshots of the summary cards and ledger rows, and details of the expected transaction(s).
