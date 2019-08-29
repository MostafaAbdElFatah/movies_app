class URLs{
  static String MAIN_URL   = "https://jsonparsingdemo-cec5b.firebaseapp.com/jsonData/";
  static String MOVIE_LIST   = "https://jsonparsingdemo-cec5b.firebaseapp.com/jsonData/moviesData.txt";
  static List<String> youtubeTraliers = [
    "eOrNdBpGMv8", "zSWdZVtXT7E"
    ,"_rRoD28-WgU", "_PZpmTj1Q8Q"
    ,"y2rYRu8UW8M", "8CTjcVr9Iao"
    ,"owK1qxDselE", "4sj1MT05lAA"
    ,"8-_9n5DtKOc", "zwhP5b4tD6g" ];

  static List<String> webViewIframeTraliers = [
  "<iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/eOrNdBpGMv8\" frameborder=\"0\" allowfullscreen></iframe>"
  ,"<iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/zSWdZVtXT7E\" frameborder=\"0\" allowfullscreen></iframe>"
  ,"<iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/_rRoD28-WgU\" frameborder=\"0\" allowfullscreen></iframe>"
  ,"<iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/_PZpmTj1Q8Q\" frameborder=\"0\" allowfullscreen></iframe>"
  ,"<iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/y2rYRu8UW8M\" frameborder=\"0\" allowfullscreen></iframe>"
  ,"<iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/8CTjcVr9Iao\" frameborder=\"0\" allowfullscreen></iframe>"
  ,"<iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/owK1qxDselE\" frameborder=\"0\" allowfullscreen></iframe>"
  ,"<iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/4sj1MT05lAA\" frameborder=\"0\" allowfullscreen></iframe>"
  ,"<iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/8-_9n5DtKOc\" frameborder=\"0\" allowfullscreen></iframe>"
  ,"<iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/zwhP5b4tD6g\" frameborder=\"0\" allowfullscreen></iframe>",
  ];





  static List<String> webViewHtmlTraliers =[
    '''
      <html>
      <body style="width:100%;height:100%;display:block;background:black;">
      <iframe width="100%" height="100%" 
      style="width:100%;height:100%;display:block;background:black;"
      src="https://www.youtube.com/embed/eOrNdBpGMv8" 
      frameborder="0" 
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture">
      </iframe>
      </body>
      </html>
    ''',
    '''
      <html>
      <body style="width:100%;height:100%;display:block;background:black;">
      <iframe width="100%" height="100%" 
      style="width:100%;height:100%;display:block;background:black;"
      src="https://www.youtube.com/embed/zSWdZVtXT7E" 
      frameborder="0" 
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
       allowfullscreen="allowfullscreen"
        mozallowfullscreen="mozallowfullscreen" 
        msallowfullscreen="msallowfullscreen" 
        oallowfullscreen="oallowfullscreen" 
        webkitallowfullscreen="webkitallowfullscreen"
       >
      </iframe>
      </body>
      </html>
    ''',
    '''
      <html>
      <body style="width:100%;height:100%;display:block;background:black;">
      <iframe width="100%" height="100%" 
      style="width:100%;height:100%;display:block;background:black;"
      src="https://www.youtube.com/embed/_rRoD28-WgU" 
      frameborder="0" 
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
       allowfullscreen="allowfullscreen"
        mozallowfullscreen="mozallowfullscreen" 
        msallowfullscreen="msallowfullscreen" 
        oallowfullscreen="oallowfullscreen" 
        webkitallowfullscreen="webkitallowfullscreen"
       >
      </iframe>
      </body>
      </html>
    ''',
    '''
      <html>
      <body style="width:100%;height:100%;display:block;background:black;">
      <iframe width="100%" height="100%" 
      style="width:100%;height:100%;display:block;background:black;"
      src="https://www.youtube.com/embed/_PZpmTj1Q8Q" 
      frameborder="0" 
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
       allowfullscreen="allowfullscreen"
        mozallowfullscreen="mozallowfullscreen" 
        msallowfullscreen="msallowfullscreen" 
        oallowfullscreen="oallowfullscreen" 
        webkitallowfullscreen="webkitallowfullscreen"
       >
      </iframe>
      </body>
      </html>
    ''',
    '''
      <html>
      <body style="width:100%;height:100%;display:block;background:black;">
      <iframe width="100%" height="100%" 
      style="width:100%;height:100%;display:block;background:black;"
      src="https://www.youtube.com/embed/y2rYRu8UW8M" 
      frameborder="0" 
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
       allowfullscreen="allowfullscreen"
        mozallowfullscreen="mozallowfullscreen" 
        msallowfullscreen="msallowfullscreen" 
        oallowfullscreen="oallowfullscreen" 
        webkitallowfullscreen="webkitallowfullscreen"
       >
      </iframe>
      </body>
      </html>
    ''',
    '''
      <html>
      <body style="width:100%;height:100%;display:block;background:black;">
      <iframe width="100%" height="100%" 
      style="width:100%;height:100%;display:block;background:black;"
      src=" https://www.youtube.com/embed/8CTjcVr9Iao" 
      frameborder="0" 
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
       allowfullscreen="allowfullscreen"
        mozallowfullscreen="mozallowfullscreen" 
        msallowfullscreen="msallowfullscreen" 
        oallowfullscreen="oallowfullscreen" 
        webkitallowfullscreen="webkitallowfullscreen"
       >
      </iframe>
      </body>
      </html>
    ''',
    '''
      <html>
      <body style="width:100%;height:100%;display:block;background:black;">
      <iframe width="100%" height="100%" 
      style="width:100%;height:100%;display:block;background:black;"
      src="https://www.youtube.com/embed/owK1qxDselE" 
      frameborder="0" 
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
       allowfullscreen="allowfullscreen"
        mozallowfullscreen="mozallowfullscreen" 
        msallowfullscreen="msallowfullscreen" 
        oallowfullscreen="oallowfullscreen" 
        webkitallowfullscreen="webkitallowfullscreen"
       >
      </iframe>
      </body>
      </html>
    ''',
    '''
      <html>
      <body style="width:100%;height:100%;display:block;background:black;">
      <iframe width="100%" height="100%" 
      style="width:100%;height:100%;display:block;background:black;"
      src="https://www.youtube.com/embed/4sj1MT05lAA" 
      frameborder="0" 
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
       allowfullscreen="allowfullscreen"
        mozallowfullscreen="mozallowfullscreen" 
        msallowfullscreen="msallowfullscreen" 
        oallowfullscreen="oallowfullscreen" 
        webkitallowfullscreen="webkitallowfullscreen"
       >
      </iframe>
      </body>
      </html>
    ''',
    '''
      <html>
      <body style="width:100%;height:100%;display:block;background:black;">
      <iframe width="100%" height="100%" 
      style="width:100%;height:100%;display:block;background:black;"
      src="https://www.youtube.com/embed/8-_9n5DtKOc" 
      frameborder="0" 
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
       allowfullscreen="allowfullscreen"
        mozallowfullscreen="mozallowfullscreen" 
        msallowfullscreen="msallowfullscreen" 
        oallowfullscreen="oallowfullscreen" 
        webkitallowfullscreen="webkitallowfullscreen"
       >
      </iframe>
      </body>
      </html>
    ''',
    '''
      <html>
      <body style="width:100%;height:100%;display:block;background:black;">
      <iframe width="100%" height="100%" 
      style="width:100%;height:100%;display:block;background:black;"
      src="https://www.youtube.com/embed/zwhP5b4tD6g" 
      frameborder="0" 
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
       allowfullscreen="allowfullscreen"
        mozallowfullscreen="mozallowfullscreen" 
        msallowfullscreen="msallowfullscreen" 
        oallowfullscreen="oallowfullscreen" 
        webkitallowfullscreen="webkitallowfullscreen"
       >
      </iframe>
      </body>
      </html>
    '''


  ];


}