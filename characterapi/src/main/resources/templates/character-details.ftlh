<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${character.name} - Details</title>
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

    <!-- Main Content -->
    <div class="container">

        <!-- Back button -->
        <a href="/characters/" class="back-btn">&#8592; Back to Gallery</a>

        <!-- Details header -->
        <div class="details-header">
            <div class="badge">Character Details</div>
            <h2 class="profile-title">${character.name}</h2>
            <p class="profile-subtitle">${character.description}</p>
        </div>

        <!-- Profile layout -->
        <div class="profile-grid">
            <div class="profile">

                <!-- LEFT: Power level stat bar -->
                <div class="image-section">
                    <div class="profile-stats">
                        <div class="stat-bar">
                            <span class="stat-label">Power Level</span>
                            <div class="stat-progress">
                                <div class="stat-fill"
                                     style="width: <#if (character.powerLevel > 100)>100<#else>${character.powerLevel}</#if>%">
                                </div>
                            </div>
                            <span class="stat-number">${character.powerLevel} / 100</span>
                        </div>
                    </div>
                </div>

                <!-- RIGHT: All character fields -->
                <div class="profile-info">

                    <!-- Basic Info box -->
                    <div class="info-box">
                        <h2 class="section-title">Basic Information</h2>
                        <div class="info-grid">
                            <div class="info-item">
                                <span class="info-label">Name:</span>
                                <span class="info-value">${character.name}</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">ID:</span>
                                <span class="info-value">${character.characterId?c}</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Quirk:</span>
                                <span class="info-value">
                                    <#if character.quirk??>${character.quirk}<#else>N/A</#if>
                                </span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Hero Rank:</span>
                                <span class="info-value">
                                    <#if character.heroRank??>${character.heroRank}<#else>N/A</#if>
                                </span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Affiliation:</span>
                                <span class="info-value">
                                    <#if character.affiliation??>
                                        <a href="/characters/affiliation/${character.affiliation}">${character.affiliation}</a>
                                    <#else>N/A</#if>
                                </span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Power Level:</span>
                                <span class="info-value">${character.powerLevel}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Description box -->
                    <div class="info-box">
                        <h2 class="section-title">Description</h2>
                        <p class="story-text">${character.description}</p>
                    </div>

                    <!-- Action buttons -->
                    <div class="action-buttons">
                        <a href="/characters/update/${character.characterId?c}"
                           class="btn btn-edit">&#9998; Edit Character</a>
                        <a href="/characters/delete/${character.characterId?c}"
                           class="btn btn-delete"
                           onclick="return confirm('Are you sure you want to delete ${character.name}?')">
                            &#128465; Delete Character
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</body>
</html>
