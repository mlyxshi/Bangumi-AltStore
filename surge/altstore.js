let fake = {
    "version": 1,
    "sources": [
      {
        "identifier": "io.altstore.example"
      },
      {
        "identifier": "com.utmapp.repos.UTM",
        "sourceURL": "https://alt.getutm.app"
      },
      {
        "identifier": "czy0729.bangumi.AltSource",
        "sourceURL": "https://raw.githubusercontent.com/mlyxshi/Bangumi-AltStore/main/bangumi.json"
      },
      {
        "identifier": "me.foxster.AltSource",
        "sourceURL": "https://raw.githubusercontent.com/therealFoxster/altsource/master/apps.json"
      }     
    ]
  }

body = JSON.stringify(fake)
$done({ body })
