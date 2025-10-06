# KQL Cheatsheet (common operators & patterns)

### Filtering & projection
- `| where <condition>`
- `| project <field1>, <field2>, ...`

### Time
- `TimeGenerated` — default timestamp field
- `| where TimeGenerated >= ago(1d)`

### Aggregations
- `| summarize count() by bin(TimeGenerated, 1h), Account`
- `| summarize dcount(Account)`

### Joins
- `t1 | join kind=inner (t2) on $left.Field == $right.Field`

### Parse & extract
- `| parse Message with * "username=" user:string " " *`
- `| extract(@"User:\s*(\w+)", 1, Message)`

### Arrays
- `mv-expand` to flatten multi-value fields
- `mv-apply` for aggregations over arrays

### Useful commands
- `limit <n>`
- `order by <field> desc`
- `render timechart`
