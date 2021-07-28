<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" indent="yes" />

    <!-- PAGE STRUCTURE  -->
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <meta name="description" content="Esame Codifica di Testi" />
                <meta name="keywords" content="Codifica di Testi, XML, XSL, Unipi" />
                <meta name="author" content="Francesco Spagnoli" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>
                    <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:title" />
                </title>
                <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
                <link href="./assets/css/FA-all.css" rel="stylesheet" type="text/css" />
                <link href="./assets/css/lightbox.css" rel="stylesheet" type="text/css" />
                <link href="./assets/css/custom.css" rel="stylesheet" type="text/css" />
            </head>
            <body>
                <div id="loading"></div>
                <div class="main-wrapper page shadow">
                    <div class="container-lg">
                        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                            <a href="./main.xml" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                            HOME
                        </a>
                            <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0 nav nav-pills">
                                <li class="nav-item">
                                    <a class="nav-link px-2 link-dark" href="./cart017.xml">Cartolina 17</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link px-2 link-dark" href="./cart018.xml">Cartolina 18</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link px-2 link-dark" href="./cart039.xml">Cartolina 39</a>
                                </li>
                            </ul>
                            <div class="col-md-3 text-end">
                                <a href="https://github.com/xFra96/CDT" target="_blank" class="btn btn-outline-primary me-2">GitHub Repo</a>
                            </div>
                        </header>
                    </div>
                    <section>
                        <div class="container-lg">
                            <xsl:apply-templates select="//tei:teiHeader" />
                        </div>
                    </section>
                    <section>
                        <div class="container-lg">
                            <xsl:apply-templates select="//tei:text[@type='cartolina']" />
                        </div>
                        <div class="container-lg">
                            <xsl:call-template name="renderInfoProgetto" />
                        </div>
                    </section>
                </div>
            </body>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
            <script src="./assets/js/lightbox-plus-jquery.js"></script>
            <script src="./assets/js/custom.js"></script>
        </html>
    </xsl:template>

    <!-- MAIN STRUCTURE  -->
    <xsl:template match="tei:text[@type='cartolina']">
        <div class="row mt-3">
            <div class="col-lg-6 col-md-12">
                <xsl:apply-templates select="//tei:figure/tei:graphic[@xml:id='fronteimg']" />
            </div>
            <div class="col-lg-6 col-md-12">
                <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='frontecart']" />
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-lg-12 col-md-12">
                <xsl:apply-templates select="//tei:figure/tei:graphic[@xml:id='retroimg']" />
            </div>
            <div class="col-lg-12 col-md-12">
                <xsl:apply-templates select="//tei:text/tei:body/tei:div[@xml:id='retrocart']" />
            </div>
        </div>
    </xsl:template>

    <!-- TEI Header -->
    <xsl:template match="tei:teiHeader">
        <div class="row">
            <div class="col-md-12 text-center">
                <h1>
                    <i>
                        <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:title" />
                    </i>
                </h1>
                <h6>
                    <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:respStmt" />
                </h6>
            </div>
        </div>
        <xsl:if test="/tei:teiCorpus[@xml:id='cart39' or @xml:id='cart17' or @xml:id='cart18']">
            <xsl:call-template name="renderInfoCartolina" />
        </xsl:if>
    </xsl:template>

    <!-- Info Cartolina -->
    <xsl:template name="renderInfoCartolina">
        <div class="row pt-5">
            <div class="col-md-12">
                <h4 class="text-center mb-5">Info cartolina</h4>
                <xsl:apply-templates select="//tei:fileDesc/tei:sourceDesc" />
            </div>
        </div>
    </xsl:template>

    <!-- Info Progetto -->
    <xsl:template name="renderInfoProgetto">
        <div class="row pt-5">
            <div class="col-md-12 pb-4">
                <a class="" data-bs-toggle="collapse" href="#collapse1" role="button" aria-expanded="false" aria-controls="collapse1">
                    <h4 class="text-center mb-5">Info progetto</h4>
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

        </div>
    </xsl:template>

    <!-- Rendering Source Desc -->
    <xsl:template match="tei:fileDesc/tei:sourceDesc">
        <div class="card">
            <table class=" mb-0 table table-striped table-hover">
                <tbody>
                    <tr>
                        <td>
                            <b>Coservata al:</b>
                        </td>
                        <td>
                            <xsl:value-of select="//tei:repository" />
                            ,
                            <xsl:value-of select="//tei:settlement" />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <b>Codice identificativo:</b>
                        </td>
                        <td>
                            <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:idno" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Autore dell'opera sul fronte della cartolina:</b>
                        </td>
                        <td>
                            <xsl:value-of select="tei:bibl/tei:author" />
                        </td>
                    </tr>
                    <xsl:if test="tei:bibl/tei:publisher">
                        <tr>
                            <td>
                                <b>Pubblicato da:</b>
                            </td>
                            <td>
                                <xsl:value-of select="tei:bibl/tei:publisher" />
                            </td>
                        </tr>
                    </xsl:if>
                    <tr>
                        <td>
                            <b>Anno:</b>
                        </td>
                        <td>
                            <xsl:value-of select="tei:bibl/tei:date" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Condizione:</b>
                        </td>
                        <td>
                            <xsl:value-of select="tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Luoghi citati:</b>
                        </td>
                        <td>
                            <xsl:apply-templates select="tei:listPlace" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Persone citate:</b>
                        </td>
                        <td>
                            <xsl:apply-templates select="tei:listPerson" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </xsl:template>

    <!-- Immagine fronte e retro -->
    <xsl:template match="tei:graphic">
        <a href="{@url}" data-lightbox="cartolina">
            <img class="cartolina img-fluid shadow p-3 mb-5 bg-img rounded" src="{@url}" />
        </a>
    </xsl:template>

    <xsl:template match="tei:zone/tei:graphic">
        <a href="{@url}" data-lightbox="zona">
            <img class="cartolina img-fluid shadow p-3 mb-5 bg-img rounded" src="{@url}" />
        </a>
    </xsl:template>

    <!-- Front Text -->
    <xsl:template match="tei:text[@type='cartolina']/tei:body/tei:div[@type='fronte']">
        <div class="px-3 py-2">
            <h4>Descrizione</h4>
            <p>
                <xsl:value-of select="//tei:figure/tei:figDesc" />
            </p>
        </div>

    </xsl:template>

    <!-- Retro Text -->
    <xsl:template match="tei:text[@type='cartolina']/tei:body/tei:div[@xml:id='retrocart']">
        <div class="container">
            <div class="accordion accordion-flush" id="accordionGroup">
                <div class="row p-2">
                    <div class="col-md-12 p-3">
                        <h4 class="text-primary py-3 text-center">Lato sinistro</h4>
                        <div class="accordion-item">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#altosx" aria-expanded="false" aria-controls="altosx">
                                <h5 class="accordion-header" id="acc0">Parte alta lato sinistro</h5>
                            </button>
                            <div id="altosx" class="accordion-collapse collapse" aria-labelledby="acc0" data-bs-parent="#accordionGroup">
                                <div class="accordion-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <xsl:apply-templates select="//tei:zone[@xml:id='altosx']" />
                                        </div>
                                        <div class="col-lg-6">
                                            <p>
                                                <xsl:apply-templates select="//tei:div/tei:div[@facs='#altosx']" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#msg" aria-expanded="false" aria-controls="msg">
                                <h5 class="accordion-header" id="acc1">Messaggio</h5>
                            </button>
                            <div id="msg" class="accordion-collapse collapse" aria-labelledby="acc1" data-bs-parent="#accordionGroup">
                                <div class="accordion-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <xsl:apply-templates select="//tei:zone[@xml:id='msg']" />
                                        </div>
                                        <div class="col-lg-6">
                                            <p>
                                                <xsl:apply-templates select="//tei:div/tei:div[@type='message']" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#artist" aria-expanded="false" aria-controls="artist">
                                <h5 class="accordion-header" id="acc2">Riferimento artista</h5>
                            </button>
                            <div id="artist" class="accordion-collapse collapse" aria-labelledby="acc2" data-bs-parent="#accordionGroup">
                                <div class="accordion-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <xsl:apply-templates select="//tei:zone[@xml:id='artist']" />
                                        </div>
                                        <div class="col-lg-6">
                                            <xsl:apply-templates select="//tei:div[@facs='#artist']" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 p-3">
                        <h4 class="text-primary py-3 text-center">Lato destro</h4>
                        <div class="accordion-item">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#altodx" aria-expanded="false" aria-controls="altodx">
                                <h5 class="accordion-header" id="acc2">Parte superiore lato destro</h5>
                            </button>
                            <div id="altodx" class="accordion-collapse collapse" aria-labelledby="acc2" data-bs-parent="#accordionGroup">
                                <div class="accordion-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <xsl:apply-templates select="//tei:zone[@xml:id='altodx']" />
                                        </div>
                                        <div class="col-lg-6">
                                            <p>
                                                <xsl:apply-templates select="//tei:div[@facs='#altodx']" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#addr" aria-expanded="false" aria-controls="addr">
                                <h5 class="accordion-header" id="acc2">Indirizzo ricevente</h5>
                            </button>
                            <div id="addr" class="accordion-collapse collapse" aria-labelledby="acc2" data-bs-parent="#accordionGroup">
                                <div class="accordion-body container">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <xsl:apply-templates select="//tei:zone[@xml:id='ricevente']" />
                                        </div>
                                        <div class="col-lg-6">
                                            <p>
                                                <xsl:apply-templates select="//tei:div/tei:div[@type='destination']" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="tei:phr">
        <p>
            <xsl:value-of select="." />
        </p>
    </xsl:template>

    <xsl:template match="tei:lb">
        <br />
    </xsl:template>

    <xsl:template match="tei:unclear">
        <xsl:if test="@reason='illegible' or @reason='faded' or not(@reason)">
            <span type="button" class="nota" data-bs-container-lg="body" data-bs-trigger="hover focus" data-bs-toggle="popover" data-bs-placement="right" data-bs-title="Note">
                <xsl:attribute name="data-bs-content">
                    <xsl:value-of select="." />
                </xsl:attribute>
                <i class="fas fa-info mx-1"></i>
            </span>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:stamp">
        <div class="alert alert-success" role="alert">
            <i class="fas fa-stamp"></i>
            -
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="tei:listPlace">
        <xsl:for-each select="tei:place">
            <p class="mb-0">
                <xsl:value-of select="tei:placeName" />
                ,
                <xsl:value-of select="tei:settlement" />
                (
                <xsl:value-of select="tei:district" />
                ) 
        -
      
        [
                <xsl:value-of select="tei:note" />
                ]
            </p>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:figure[@type='logo']">
        <div class="alert alert-warning" role="alert">
            <i class="fas fa-file-image"></i>
            -  <xsl:value-of select="." />
        </div>
    </xsl:template>

    <xsl:template match="tei:listPerson">
        <xsl:for-each select="tei:person">
            <p class="mb-0">
                <xsl:value-of select="tei:persName" />
                <xsl:if test="/tei:occupation">
                    ,
                    <xsl:value-of select="tei:occupation" />
                </xsl:if>
                [
                <xsl:value-of select="tei:note" />
                ]
            </p>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>