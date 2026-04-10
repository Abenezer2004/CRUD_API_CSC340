<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title!"Update Character"}</title>
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
                <li><a href="/characters/add">Add Character</a></li>
            </ul>
        </div>
    </nav>

    <!-- Main content -->
    <div class="container">

        <a href="/characters/${character.characterId?c}" class="back-btn">&#8592; Back to Details</a>

        <div class="header">
            <h1 class="page-header">${title!"Update Character"}</h1>
            <p class="subtitle">Edit the fields below and save your changes.</p>
        </div>

        <#if RequestParameters.error??>
            <p class="error-msg">Update failed. Please check your inputs and try again.</p>
        </#if>

        <div class="form-section">
            <!--
                POST /characters/update/{id}  → CharacterUiController.updateCharacter()
                Values are pre-filled from the "character" model attribute.
                Input "name" attributes MUST match Character.java field names.
            -->
            <form class="character-form"
                  action="/characters/update/${character.characterId?c}"
                  method="post">

                <div class="form-group">
                    <label for="name">Character Name <span class="required">*</span></label>
                    <input type="text" id="name" name="name" class="form-input"
                           value="${character.name}" required>
                </div>

                <div class="form-group">
                    <label for="description">Description <span class="required">*</span></label>
                    <input type="text" id="description" name="description" class="form-input"
                           value="${character.description}" required>
                </div>

                <div class="form-group">
                    <label for="quirk">Quirk</label>
                    <input type="text" id="quirk" name="quirk" class="form-input"
                           value="<#if character.quirk??>${character.quirk}</#if>">
                </div>

                <div class="form-group">
                    <label for="heroRank">Hero Rank</label>
                    <input type="text" id="heroRank" name="heroRank" class="form-input"
                           value="<#if character.heroRank??>${character.heroRank}</#if>">
                </div>

                <div class="form-group">
                    <label for="affiliation">Affiliation</label>
                    <input type="text" id="affiliation" name="affiliation" class="form-input"
                           value="<#if character.affiliation??>${character.affiliation}</#if>">
                </div>

                <div class="form-group">
                    <label for="powerLevel">Power Level (0–100) <span class="required">*</span></label>
                    <input type="number" id="powerLevel" name="powerLevel" class="form-input"
                           value="${character.powerLevel}" min="0" max="100" required>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-save">Save Changes</button>
                    <a href="/characters/${character.characterId?c}" class="btn btn-cancel">Cancel</a>
                </div>

            </form>
        </div>
    </div>
</body>
</html>
