<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
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

    <div class="container">
        <a href="/characters/" class="back-btn">&#8592; Back to Gallery</a>

        <div class="error-page">
            <h1 class="error-title">&#9888; Oops!</h1>
            <p class="error-text">
                <#if errorMessage??>${errorMessage}<#else>Something went wrong. Please try again.</#if>
            </p>
            <a href="/characters/" class="btn">Go Back to Gallery</a>
        </div>
    </div>
</body>
</html>
