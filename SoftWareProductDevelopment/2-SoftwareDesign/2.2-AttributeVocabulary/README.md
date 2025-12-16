### Attribute Vocabulary

This vocabulary describes the data elements, their types, formats, and constraints used in the "Science-Life Assistant" system.

| Class / Object | Attribute | Description | Data Type | Format / Unit | Range / Constraint |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **User** | `userID` | Unique identifier for the system user | Integer | Auto-increment | PK, > 0 |
| | `name` | User's display name or login | String | Alphanumeric | 3-50 chars, Unique |
| | `incomeLevel` | Financial status for filtering housing | String | Enum text | 'Low', 'Medium', 'High' |
| | `education` | User's educational background | String | Free text | Max 50 chars |
| **Housing** | `housingID` | Unique identifier for the rental unit | Integer | Auto-increment | PK, > 0 |
| | `address` | Physical location of the housing | String | Postal address | 10-255 chars, Not Null |
| | `price` | Monthly rental cost | Decimal | Currency (USD) | > 0.00 |
| | `isSafeArea` | Indicator of district safety | Boolean | True/False | Not Null |
| | `hasWorkspace` | Presence of a dedicated workspace | Boolean | True/False | Not Null |
| **Provider** | `providerID` | Unique ID of the housing provider | Integer | Auto-increment | PK, > 0 |
| | `name` | Name of the agency or landlord | String | Text | Max 100 chars |
| **Article** | `articleID` | Unique ID for the scientific article | Integer | Auto-increment | PK, > 0 |
| | `title` | The full title of the publication | String | Text | Max 255 chars, Not Null |
| | `DOI` | Digital Object Identifier | String | DOI format (e.g., 10.1000/xyz) | Unique |
| | `publishDate` | Date when the article was published | Date | YYYY-MM-DD | <= Current Date |
| **Summary** | `summaryID` | Unique ID for the generated summary | Integer | Auto-increment | PK, > 0 |
| | `summaryText` | AI-generated concise content | Text | Text block | Max 5000 chars |
| | `qualityScore` | User rating of the summary | Integer | Numeric score | 1 to 5 |
| | `generatedAt` | Timestamp of generation | Timestamp | ISO 8601 | Default: Current Time |
