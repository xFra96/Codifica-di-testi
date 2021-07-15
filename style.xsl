<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
                <link href="./assets/FA-all.css" rel="stylesheet" type="text/css" />
                <link href="./assets/custom.css" rel="stylesheet" type="text/css" />
                <title>
                    <xsl:value-of select="tei:teiCorpus//tei:fileDesc/tei:titleStmt/tei:title" />
                </title>
            </head>
            <body>
                <!-- parte introduttiva -->
                <header>
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <div class="container-lg-fluid">
                            <a class="navbar-brand" href="./main.xml">HOMEPAGE</a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                    <li class="nav-item">
                                        <a class="nav-link" href="./cart017.xml">Cartolina 17</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="./cart018.xml">Cartolina 18</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="./cart039.xml">Cartolina 39</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </header>

                <section>
                    <div class="container-lg">
                        <xsl:apply-templates select="//tei:teiCorpus[@xml:id='cart17']" />
                    </div>
                </section>
                <section>
                    <div class="container-lg">
                        <xsl:apply-templates select="//tei:teiCorpus[@xml:id='cart18']" />
                    </div>
                </section>
                <section>
                    <div class="container-lg">
                        <xsl:apply-templates select="//tei:teiCorpus[@xml:id='cart39']" />
                    </div>
                </section>
                <section>
                    <div class="container-lg">
                        <xsl:apply-templates select="//tei:teiCorpus/tei:teiHeader[@xml:id='main']" />
                    </div>
                </section>
            </body>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
            <script src="./assets/custom.js"></script>
        </html>
    </xsl:template>

    <!-- PAGE STRUCTURE  -->
    <xsl:template match="tei:teiCorpus[@xml:id='cart17' or @xml:id='cart18' or @xml:id='cart39']">
        <div class="row mt-3">
            <div class="col-md-12">
                <xsl:apply-templates select="//tei:teiHeader" />
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-lg-6 col-md-12">
                <xsl:apply-templates select="//tei:figure/tei:graphic[@xml:id='fronteimg']" />
            </div>
            <div class="col-lg-6 col-md-12">
                <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='frontecart']" />
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-lg-6 col-md-12">
                <xsl:apply-templates select="//tei:figure/tei:graphic[@xml:id='retroimg']" />
            </div>
            <div class="col-lg-6 col-md-12">
                <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='retrocart']" />
            </div>
        </div>

    </xsl:template>

    <!-- Main page -->
    <xsl:template match="tei:teiHeader[@xml:id='main']">
        <div class="row text-center">
            <h1>
                <i>
                    <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:title" />
                </i>
            </h1>
            <h6>
                <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:respStmt" />
            </h6>
        </div>
    </xsl:template>

    <!-- TEI Header -->
    <xsl:template match="tei:teiHeader">
        <div class="row text-center">
            <h1>
                <i>
                    <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:title" />
                </i>
            </h1>
            <h6>
                <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:respStmt" />
            </h6>
        </div>
        <div class="row pt-5">
            <div class="col-md-12 pb-4">
                <a class="" data-bs-toggle="collapse" href="#collapse1" role="button" aria-expanded="false" aria-controls="collapse1">
                    <h4 class="text-center mb-5">Info codifica</h4>
                </a>
                <div class="collapse" id="collapse1">
                    <div class="card card-body">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>
                                        <b>Ente di appartenenza:</b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="//tei:name[@xml:id='SP']" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Encoding by:</b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="//tei:name[@xml:id='FS']" />
                                        -
                                        <xsl:value-of select="//tei:name[@xml:id='TC']" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Compilatore:</b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="//tei:name[@xml:id='FS']" />
                                        -
                                        <xsl:value-of select="//tei:name[@xml:id='TC']" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Responsabile scientifico:</b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="//tei:name[@xml:id='GP']" />
                                        -
                                        <xsl:value-of select="//tei:name[@xml:id='ES']" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Funzionario responsabile:</b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="//tei:name[@xml:id='MR']" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Note non rilevanti ai fini della codifica:</b>
                                    </td>
                                    <td>
                                        <xsl:value-of select="//tei:notesStmt[@xml:id='notesStmt1']" />
                                    </td>

                                </tr>
                            </tbody>
                        </table>
                        <p class="text-center">
                            ©
                            <xsl:value-of select="//tei:publicationStmt/tei:date" />
                            <i>
                                <xsl:value-of select="//tei:publicationStmt/tei:availability" />
                                -
                                <xsl:value-of select="//tei:publicationStmt/tei:distributor" />
                                ,
                                <xsl:value-of select="//tei:publicationStmt/tei:address" />
                                <xsl:value-of select="//tei:publicationStmt/tei:address/tei:addrline[1]" />
                            </i>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <a class="" data-bs-toggle="collapse" href="#collapse2" role="button" aria-expanded="false" aria-controls="collapse2">
                    <h4 class="text-center mb-5">Info cartolina</h4>
                </a>
                <div class="collapse" id="collapse2">
                    <div class="card card-body">
                        <xsl:apply-templates select="//tei:fileDesc/tei:sourceDesc" />
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

    <!-- Rendering Soucer Desc -->
    <xsl:template match="tei:fileDesc/tei:sourceDesc">
        <table class="table">
            <tbody>
                <tr>
                    <td>
                        <b>Autore dell'opera:</b>
                    </td>
                    <td>
                        <xsl:value-of select="//tei:fileDesc/tei:sourceDesc/tei:bibl/tei:author" />
                    </td>
                </tr>
                <xsl:if test="//tei:fileDesc/tei:sourceDesc/tei:bibl/tei:publisher">
                    <tr>
                        <td>
                            <b>Pubblicato da:</b>
                        </td>
                        <td>
                            <xsl:value-of select="//tei:fileDesc/tei:sourceDesc/tei:bibl/tei:publisher" />
                        </td>
                    </tr>
                </xsl:if>
                <tr>
                    <td>
                        <b>Anno:</b>
                    </td>
                    <td>
                        <xsl:value-of select="//tei:fileDesc/tei:sourceDesc/tei:bibl/tei:date" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Codice identificativo:</b>
                    </td>
                    <td>
                        <xsl:value-of select="//tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Condizione:</b>
                    </td>
                    <td>
                        <xsl:value-of select="//tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition" />
                    </td>
                </tr>

            </tbody>
        </table>
    </xsl:template>

    <!-- Fronte Cart -->
    <xsl:template match="tei:text[@type='cartolina']/tei:body/tei:div[@type='fronte']">
        <p>
            <xsl:value-of select="//tei:figure/tei:figDesc" />
        </p>
    </xsl:template>

    <!-- Immagine fronte e retro-->
    <xsl:template match="tei:figure/tei:graphic">
        <img class="cartolina img-fluid " src="{@url}" />
        <xsl:apply-templates select="/tei:facsimile" />
    </xsl:template>

    <!-- Immagine fronte e retro-->
    <xsl:template match="tei:text[@type='cartolina']/tei:body/tei:div[@xml:id='retrocart']">
        <div class="accordion accordion-flush" id="accordionFlushExample">
            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#msg" aria-expanded="false" aria-controls="msg">
                        Messaggio
                    </button>
                </h2>
                <div id="msg" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                        <xsl:apply-templates select="//tei:div/tei:div[@type='message']" />
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="tei:lb">
        <br />
    </xsl:template>

    <xsl:template match="tei:unclear">
        <xsl:if test="@reason='illegible'">
            <span type="button" class="nota" data-bs-container-lg="body" data-bs-trigger="hover focus" data-bs-toggle="popover" data-bs-placement="right" data-bs-title="Note">
                <xsl:attribute name="data-bs-content">
                    <xsl:value-of select="." />
                </xsl:attribute>
                <i class="fas fa-comment"></i>
            </span>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>