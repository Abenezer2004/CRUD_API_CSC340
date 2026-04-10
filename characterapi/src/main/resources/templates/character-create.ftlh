<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Character</title>
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
    <!-- Background decoration -->
    <div class="bg-shape">
        <div class="shape1"></div>
        <div class="shape2"></div>
        <div class="shape3"></div>
    </div>

    <!-- NAVBAR -->
    <nav class="main-navbar">
        <div class="nav-container">
            <div class="logo">Hero Gallery</div>
            <ul class="nav-menu">
                <li><a href="/characters/">Home</a></li>
                <li><a href="/characters/about">About</a></li>
                <li><a href="/characters/add" class="active">Add Character</a></li>
            </ul>
        </div>
    </nav>

    <!-- Main content -->
    <div class="container">
        <a href="/characters/" class="back-btn">&#8592; Back to Gallery</a>

        <div class="header">
            <h1 class="page-header">Add a New Character</h1>
            <p class="subtitle">Use the form below to add a new character to the gallery.</p>
        </div>

        <#if RequestParameters.error??>
            <p class="error-msg">Something went wrong. Please check your inputs and try again.</p>
        </#if>

        <div class="form-section">
            <!--
                POST /characters/  → CharacterUiController.createCharacter()
                Input "name" attributes MUST match the Java field names in Character.java
                so Spring MVC can auto-bind them (no @RequestBody needed for form data).
            -->
            <form class="character-form" action="/characters/" method="post">

                <div class="form-group">
                    <label for="name">Character Name <span class="required">*</span></label>
                    <input type="text" id="name" name="name" class="form-input"
                           placeholder="e.g., Izuku Midoriya" required>
                </div>

                <div class="form-group">
                    <label for="description">Description <span class="required">*</span></label>
                    <input type="text" id="description" name="description" class="form-input"
                           placeholder="e.g., The main protagonist of My Hero Academia" required>
                </div>

                <div class="form-group">
                    <label for="quirk">Quirk</label>
                    <input type="text" id="quirk" name="quirk" class="form-input"
                           placeholder="e.g., One For All">
                </div>

                <div class="form-group">
                    <label for="heroRank">Hero Rank</label>
                    <input type="text" id="heroRank" name="heroRank" class="form-input"
                           placeholder="e.g., No. 1 Pro Hero">
                </div>

                <div class="form-group">
                    <label for="affiliation">Affiliation</label>
                    <input type="text" id="affiliation" name="affiliation" class="form-input"
                           placeholder="e.g., U.A. High School">
                </div>

                <div class="form-group">
                    <label for="powerLevel">Power Level (0–100) <span class="required">*</span></label>
                    <input type="number" id="powerLevel" name="powerLevel" class="form-input"
                           placeholder="e.g., 85" min="0" max="100" required>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn">Add Character</button>
                    <a href="/characters/" class="btn btn-cancel">Cancel</a>
                </div>

            </form>
        </div>
    </div>
</body>
</html>
