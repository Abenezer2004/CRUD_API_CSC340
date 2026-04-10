<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title!"Character Gallery"}</title>
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
                <li><a href="/characters/" class="active">Home</a></li>
                <li><a href="/characters/about">About</a></li>
                <li><a href="/characters/add">Add Character</a></li>
            </ul>
        </div>
    </nav>

    <!-- MAIN CONTENT -->
    <div class="container">
        <div class="header">
            <header>
                <h1 class="title">Characters from My Hero Academia</h1>
                <p class="subtitle">These are some of my favorite characters from this work of fiction.</p>
            </header>
        </div>

        <!-- Search bar — EXTRA CREDIT -->
        <div class="search-section">
            <form action="/characters/search" method="get">
                <div class="search-bar">
                    <input type="text" name="name"
                           placeholder="Search characters by name..."
                           value="<#if searchTerm??>${searchTerm}</#if>">
                    <button type="submit">Search</button>
                </div>
            </form>

            <#if filterAffiliation??>
                <p class="filter-banner">
                    Showing affiliation: <strong>${filterAffiliation}</strong>
                    &nbsp;|&nbsp;<a href="/characters/">Show all</a>
                </p>
            </#if>
            <#if searchTerm??>
                <p class="filter-banner">
                    Search results for: <strong>"${searchTerm}"</strong>
                    &nbsp;|&nbsp;<a href="/characters/">Show all</a>
                </p>
            </#if>
        </div>

        <!-- Character cards -->
        <div class="card--grid">
            <#if characterList?has_content>
                <#list characterList as character>
                    <div class="card1">
                        <div class="card1-content">
                            <h3 class="char-name">${character.name}</h3>
                            <p class="char-description">${character.description}</p>

                            <div class="info-row">
                                <span class="label">Quirk:</span>
                                <span class="value">
                                    <#if character.quirk??>${character.quirk}<#else>N/A</#if>
                                </span>
                            </div>
                            <div class="info-row">
                                <span class="label">Hero Rank:</span>
                                <span class="value">
                                    <#if character.heroRank??>${character.heroRank}<#else>N/A</#if>
                                </span>
                            </div>
                            <div class="info-row">
                                <span class="label">Affiliation:</span>
                                <span class="value">
                                    <#if character.affiliation??>
                                        <a href="/characters/affiliation/${character.affiliation}">${character.affiliation}</a>
                                    <#else>N/A</#if>
                                </span>
                            </div>
                            <div class="info-row">
                                <span class="label">Power Level:</span>
                                <span class="value">${character.powerLevel}</span>
                            </div>

                            <!-- Navigation buttons -->
                            <div class="card-buttons">
                                <a href="/characters/${character.characterId?c}" class="btn">View Details</a>
                                <a href="/characters/update/${character.characterId?c}" class="btn btn-edit">Edit</a>
                                <a href="/characters/delete/${character.characterId?c}"
                                   class="btn btn-delete"
                                   onclick="return confirm('Delete ${character.name}? This cannot be undone.')">Delete</a>
                            </div>
                        </div>
                    </div>
                </#list>
            <#else>
                <div class="empty-state">
                    <p>No characters found.</p>
                    <a href="/characters/add" class="btn">Add the first character!</a>
                </div>
            </#if>
        </div>
    </div>
</body>
</html>
