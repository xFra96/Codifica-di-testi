<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="html" indent="yes" />
    
    <xsl:template match="/">
        <html>
            <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
                <link href="./assets/custom.css" rel="stylesheet" type="text/css" />
                <meta charset="UTF-8" />
                <title>
                    <xsl:value-of select="tei:teiCorpus//tei:fileDesc/tei:titleStmt/tei:title" />
                </title>
            </head>
            <body>
                <!-- parte introduttiva -->
                <header>
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <div class="container-fluid">
                            <a class="navbar-brand" href="#">Navbar</a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                    <li class="nav-item">
                                        <a href="#cart17">XVII</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </header>
                
                <section id="cart017">
                    <div class="container">
                        <xsl:apply-templates select="//tei:teiCorpus[@xml:id='cart17']" />
                    </div>
                </section>
                <section id="cart018">
                    <div class="container">
                        <xsl:apply-templates select="//tei:teiCorpus[@xml:id='cart018']" />
                    </div>
                </section>
                <section id="cart039">
                    <div class="container">
                        <xsl:apply-templates select="//tei:teiCorpus[@xml:id='cart39']" />
                    </div>
                </section>
                <section>
                    <div class="container">
                        <xsl:apply-templates select="//tei:teiCorpus/tei:teiHeader[@xml:id='main']" />
                    </div>
                </section>
            </body>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        </html>
    </xsl:template>
    
    <!-- MAIN PAGE -->
    <xsl:template match="tei:teiCorpus[@xml:id='cart17' or @xml:id='cart18' or @xml:id='cart39']">
        <div class="row text-center">
            <h1>
                <i>
                    <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" />
                </i>
            </h1>
            <h6>
                <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt" />
            </h6>
        </div>
        <div class="row mt-3">
            <div class="col-md-12">
                <xsl:apply-templates select="//tei:teiHeader" />
            </div>
            <div class="col-md-6">
                <xsl:apply-templates select="//tei:figure[@xml:id='frontecart']" />
                <xsl:apply-templates select="//tei:figure[@xml:id='retrocart']" />
            </div>
            <div class="col-md-6"></div>
            <xsl:apply-templates select="/tei:fileDesc/tei:sourceDesc/tei:listPerson" />
            <xsl:apply-templates select="/tei:fileDesc/tei:sourceDesc/tei:listPlace" />
        </div>
        
    </xsl:template>
    
    <!-- TEI Header -->
    <xsl:template match="tei:teiHeader">
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
                            ©<xsl:value-of select="//tei:publicationStmt/tei:date" />	
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
                    </div>
                </div>                
            </div>
        </div>
    </xsl:template>
    
    <!-- PERSONE -->
    <xsl:template match="tei:listPerson">
        <div class="persone">
            <xsl:apply-templates />
        </div>
    </xsl:template>
    
    <xsl:template match="tei:person">
        <div class="persona">
            <p>
                <b>Nome: </b>
                <xsl:value-of select="tei:persName/tei:forename" />
            </p>
            <p>
                <b>Cognome: </b>
                <xsl:value-of select="tei:persName/tei:surname" />
            </p>
            <p>
                <b>Sesso: </b>
                <xsl:value-of select="tei:sex" />
            </p>
        </div>
    </xsl:template>
    
    <!-- LUOGHI -->
    <xsl:template match="tei:listPlace">
        <div class="luogo">
            <xsl:apply-templates />
        </div>
    </xsl:template>
    
    <xsl:template match="tei:place">
        <div class="place">
            <p>
                <b>Luogo: </b>
                <xsl:value-of select="tei:settlement" />
                di
                <xsl:value-of select="tei:placeName" />
                (
                <xsl:value-of select="tei:district[@type='provincia']" />
                ),
                <xsl:value-of select="tei:country" />
                .
            </p>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:correspDesc">
        <div class="corrispondenze">
            <xsl:apply-templates />
        </div>
    </xsl:template>
    
    <!-- MITTENTE E DESTINATARIO -->
    <xsl:template match="tei:correspAction[@type='sent']">
        <div class="mittente">
            <p>
                <b>Mittente: </b>
                <xsl:value-of select="tei:persName" />
            </p>
            <p>
                <b>Luogo: </b>
                <xsl:value-of select="tei:placeName" />
            </p>
            <p>
                <b>Data: </b>
                <xsl:value-of select="tei:date" />
            </p>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:correspAction[@type='received']">
        <div class="destinatario">
            <p>
                <b>Destinatario: </b>
                <xsl:value-of select="tei:persName" />
            </p>
        </div>
    </xsl:template>
    
    <!-- TIPOLOGIA -->
    <xsl:template match="tei:textClass">
        <div class="descr">
            <p>
                <b>Tipologia: </b>
                <xsl:value-of select="tei:keywords/tei:term[@type='descr1']" />
                -
                <xsl:value-of select="tei:keywords/tei:term[@type='descr2']" />
            </p>
        </div>
    </xsl:template>
    
    <!-- LINGUA -->
    <xsl:template match="tei:langUsage">
        <div class="lingua">
            <p>
                <b>Lingua: </b>
                <xsl:apply-templates />
            </p>
        </div>
    </xsl:template>
    
    <!-- immagine fronte e retro-->
    <xsl:template match="tei:figure/tei:graphic">
        <img class="cartolina" src="{@url}" />
    </xsl:template>
    
    <!-- template fronte -->
    <xsl:template match="tei:text">
        <div class="corpo">
            <xsl:apply-templates />
        </div>
    </xsl:template>
    
    <!-- descrizione della cartolina + note -->
    
    <!--<xsl:template match="tei:figure">
         <div class="fronte">
         <p>
         <xsl:value-of select="tei:figDesc" />
         <xsl:for-each select="tei:note">
         <xsl:value-of select="." />
         </xsl:for-each>
         </p>
         
         </div>
         </xsl:template>-->
    
    <!-- codifica del fronte e del retro -->
    
    <xsl:template match="tei:div[@type='message']">
        <div class="testo">
            <p>
                <xsl:apply-templates />
            </p>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@xml:id='part2']">
        <div class="testofronte">
            <p>
                <xsl:apply-templates />
            </p>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <br />
    </xsl:template>
    
    <xsl:template match="tei:choice">
        <i>
            <xsl:value-of select="tei:abbr" />
        </i>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='codice']">
        <div class="archivio">
            <xsl:apply-templates />
        </div>
    </xsl:template>
    
    <!-- FOOTER -->
    <xsl:template match="tei:title">
        <h1>
            <xsl:value-of select="." />
        </h1>
    </xsl:template>
    <xsl:template match="tei:respStmt">
        <div>
            <p>
                <b>
                    <xsl:value-of select="tei:resp" />
                    :
                </b>
            </p>
            <p>
                <xsl:for-each select="tei:name">
                    <xsl:value-of select="." />
                </xsl:for-each>
            </p>
        </div>
    </xsl:template>
    <!-- edizione -->
    <xsl:template match="tei:edition">
        <div>
            <p>
                <i>
                    <xsl:value-of select="." />
                    - anno
                    <xsl:value-of select="tei:date" />
                </i>
            </p>
        </div>
    </xsl:template>
    <xsl:template match="tei:publicationStmt">
        <div>
            <p>
                <i>
                    Pubblicazione
                    <xsl:value-of select="tei:publisher" />
                    (
                    <xsl:value-of select="tei:pubPlace" />
                    ) -
                    <xsl:value-of select="tei:availability/tei:p" />
                </i>
            </p>
        </div>
    </xsl:template>
    <xsl:template match="/tei:fileDesc/tei:sourceDesc">
        <div>
            <p>
                <i>
                    <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:country" />
                    -
                    <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:settlement" />
                    <br />
                    <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:repository" />
                </i>
            </p>
        </div>
    </xsl:template>
</xsl:stylesheet>