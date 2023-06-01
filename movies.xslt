<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="/Movies">
    <html>
      <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Movie Theatre</title>
        <style>
          body { 
            background-color: #002349; 
            font-family:Arial, Helvetica, sans-serif;
            color: #333;
          }
          main {
            max-width: 1000px;
            margin: 0 auto;
          }
          h1 {                        <!-- cinema-->
            font-family: sans-serif-medium;
            font-size: 3rem;
            color:#4169E1;
            text-align:center;  
          }

          h2 {                        <!-- theatre name-->
            font-family: helvetica;
            font-size: 2rem;
            color:#FF595A;
          }

          h3 {
            margin-top: 0;            <!-- movie name-->
            font-family: bold;
            font-size: 1.5rem;
            color: #FF595A;
          }

          h4 {
            margin-top: 0;            <!-- Genre-->
            font-family: bold;
            font-size: 1rem;
            color: #FF595A;
          }

          h5 {
            margin-top: 0;            <!-- address-->
            font-family: bold;
            font-size: 1.0rem;
            color: #FF595A;
            display: inline-block;
          }


          h6 {
            margin-top: 0;            <!-- rating-->
            font-family: bold;
            font-size: 1.0rem;
            display: inline-block;
            color: #000;
            <!-- font-weight: bold;/ -->
          }

          t1 {
            display: block;    <!-- timings-->
            margin: 0 4px;
            color: #F5BD02;
            font-family: cursive;
          }

          t2 {
            display: inline-block;    <!-- genre-->
            margin: 0 4px;
            color: #F5BD02;
            border: 2px solid black;
            border-radius: 10px;
            border-color: #FF595A;
            padding: 6px;
          }

          moviesection{
            border: 2px solid black;
            border-radius: 10px;
          }

          table {
            table-layout: fixed;
            width: 100%;
          }
          
          th, td {
            width: 43.33%;
          }

          img { 
            margin: 0 1em 0 0;
            border: .1em solid #333;
            box-shadow: 2px 2px 5px #aaa;
          }

          section { 
            display: flex; 
            margin-bottom: 2em; 
          }


        </style>
      </head>
      <body>
        <main>
          <h1>Cinemas</h1>
          <xsl:for-each select="Theatre">
            <h2><xsl:value-of select="TheatreName" /></h2>
            <h2 class = "TheatreAddress">
              <h5><xsl:value-of select="TheatreAddress/@street"/></h5>
              <h5><xsl:text>,</xsl:text></h5>
              <h5><xsl:value-of select="TheatreAddress/@city"/></h5>
              <h5><xsl:text>,</xsl:text></h5>
              <h5><xsl:value-of select="TheatreAddress/@state"/></h5>
            </h2>
              <xsl:for-each select="Movie">
                <section>
                  <xsl:variable name="filePath" select="'images/'" />   <!-- Set the image folder path -->
                  <xsl:variable name="fileName" select="Poster" />

                  <img src="{$filePath}{$fileName}" alt="Movie Cover" />
                  <div>
                    <h3><xsl:value-of select="MovieName" /></h3>
                    <table>
                      <tr>
                        <td>

                          <h6><xsl:value-of select="Rating" /></h6>

                          <h6><xsl:value-of select="Duration" /></h6>

                          <h4><xsl:text>Genre:</xsl:text></h4>
                          <xsl:for-each select="Genres/Genre">
                            <t1><xsl:value-of select="." /></t1>
                          </xsl:for-each>
                        </td>
                        <td>
                          <xsl:for-each select="MovieTimings/MovieTiming">
                            <t2><xsl:value-of select="." /></t2>
                          </xsl:for-each>
                        </td>

                      </tr>
                    </table>
                  </div>

                </section>
              </xsl:for-each>
          </xsl:for-each> 
        </main>
      </body>
    
    </html>
  </xsl:template>

</xsl:stylesheet>