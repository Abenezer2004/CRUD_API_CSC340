# CRUD_API_CSC340
# My Hero Academia Characters API

A RESTful CRUD API for managing My Hero Academia characters, built with Spring Boot, Spring Data JPA, and PostgreSQL.

---

## Installation & Setup

### Prerequisites
- Java 25 JDK
- Neon.tech PostgreSQL Database (cloud-based)
  - No local PostgreSQL installation needed

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <your-github-repo-link>
   cd characterapi
   ```

2. **Install dependencies**

   On Windows:
   ```cmd
   mvnw.cmd clean install
   ```

   On Mac/Linux:
   ```bash
   ./mvnw clean install
   ```

3. **Configure the database**

   First, stop Git from tracking your credentials:
   ```bash
   git update-index --skip-worktree src/main/resources/application.properties
   ```

   Then edit `src/main/resources/application.properties` with your Neon.tech connection string:
   

4. **Run the application**

   On Windows:
   ```cmd
   mvnw.cmd spring-boot:run
   ```

   On Mac/Linux:
   ```bash
   ./mvnw spring-boot:run
   ```

   Or in VS Code, open `CharacterapiApplication.java` and click the  **Run** button above the main method.

   The server will start at **http://localhost:8080**

---

## API Endpoints

All endpoints use the base URL: `http://localhost:8080/characters`

---

### 1. Get All Characters

```http
GET /characters/
```

**Description**: Returns a list of all characters in the database.

**Response**: `200 OK`

```json
[
  {
    "characterId": 1,
    "name": "Deku",
    "description": "The main protagonist of My Hero Academia",
    "quirk": "One For All",
    "heroRank": "Student",
    "affiliation": "UA High",
    "powerLevel": 85
  }
]
```

---

### 2. Get Character by ID

```http
GET /characters/{id}
```

**Description**: Returns a single character by their ID.

**Path Parameters**:
- `id` (Long, required): The unique ID of the character

**Response**: `200 OK` or `404 Not Found`

#### Success (200 OK)
```json
{
  "characterId": 1,
  "name": "Deku",
  "description": "The main protagonist of My Hero Academia",
  "quirk": "One For All",
  "heroRank": "Student",
  "affiliation": "UA High",
  "powerLevel": 85
}
```

#### Not Found (404)
```
(Empty body)
```

---

### 3. Add a New Character

```http
POST /characters/
```

**Description**: Creates a new character in the database.

**Request Body**:
- `name` (String, required)
- `description` (String, required)
- `quirk` (String): Character's superpower
- `heroRank` (String): e.g. "Student", "Pro Hero", "Villain"
- `affiliation` (String): e.g. "UA High", "Pro Hero", "League of Villains"
- `powerLevel` (int): Numeric power rating

**Response**: `200 OK`

#### Example Request Body
```json
{
  "name": "Bakugo",
  "description": "An explosive and aggressive hero student, childhood friend and rival of Deku",
  "quirk": "Explosion",
  "heroRank": "Student",
  "affiliation": "UA High",
  "powerLevel": 91
}
```

#### Example Response (200 OK)
```json
{
  "characterId": 7,
  "name": "Bakugo",
  "description": "An explosive and aggressive hero student, childhood friend and rival of Deku",
  "quirk": "Explosion",
  "heroRank": "Student",
  "affiliation": "UA High",
  "powerLevel": 91
}
```

---

### 4. Update a Character

```http
PUT /characters/{id}
```

**Description**: Updates an existing character by ID.

**Path Parameters**:
- `id` (Long, required): The ID of the character to update

**Response**: `200 OK` or `404 Not Found`

#### Example Request Body
```json
{
  "name": "Deku",
  "description": "The main protagonist, now a Pro Hero",
  "quirk": "One For All",
  "heroRank": "Pro Hero",
  "affiliation": "UA High",
  "powerLevel": 99
}
```

#### Example Response (200 OK)
```json
{
  "characterId": 1,
  "name": "Deku",
  "description": "The main protagonist, now a Pro Hero",
  "quirk": "One For All",
  "heroRank": "Pro Hero",
  "affiliation": "UA High",
  "powerLevel": 99
}
```

---

### 5. Delete a Character

```http
DELETE /characters/{id}
```

**Description**: Deletes a character by ID.

**Path Parameters**:
- `id` (Long, required): The ID of the character to delete

**Response**: `204 No Content`

```
(Empty body)
```

---

### 6. Get Characters by Affiliation

```http
GET /characters/affiliation/{affiliation}
```

**Description**: Returns all characters that belong to a given affiliation.

**Path Parameters**:
- `affiliation` (String, required): e.g. "UA High", "Pro Hero", "League of Villains"

**Response**: `200 OK`

#### Example Request
```
GET /characters/affiliation/UA High
```

#### Example Response (200 OK)
```json
[
  {
    "characterId": 1,
    "name": "Deku",
    "affiliation": "UA High"
  },
  {
    "characterId": 2,
    "name": "All Might",
    "affiliation": "UA High"
  },
  {
    "characterId": 4,
    "name": "Todoroki",
    "affiliation": "UA High"
  }
]
```

---

### 7. Search Characters by Name

```http
GET /characters/search?name={substring}
```

**Description**: Returns all characters whose name contains the given substring. Returns all characters if no name is provided.

**Query Parameters**:
- `name` (String, optional): Substring to search for in character names

**Response**: `200 OK`

#### Example Request
```
GET /characters/search?name=All
```

#### Example Response (200 OK)
```json
[
  {
    "characterId": 2,
    "name": "All Might",
    "description": "The Symbol of Peace and greatest hero",
    "quirk": "One For All",
    "heroRank": "No.1 Hero",
    "affiliation": "UA High",
    "powerLevel": 100
  }
]
```

---

## Demo Video

[Click here to watch the demo](https://uncg-my.sharepoint.com/personal/asshiferaw_uncg_edu/_layouts/15/stream.aspx?id=%2Fpersonal%2Fasshiferaw%5Funcg%5Fedu%2FDocuments%2FRecordings%2FREST%5FAPI%5FDEMO%2Emkv&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&ga=1&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview%2Edc66c3e9%2Dcf30%2D4d81%2Daab2%2D404270e01fd9 )



[Click here to watch the MVC demo] https://uncg-my.sharepoint.com/:v:/g/personal/asshiferaw_uncg_edu/IQCX1scCJKkfRoTpoE-tmE-sARRagnLSI4ktwMWa5Lt41QY?e=cfNaaM
