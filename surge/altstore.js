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
        "identifier": "tv.bangumi.czy0729",
        "sourceURL": "https://raw.githubusercontent.com/mlyxshi/Bangumi-AltStore/main/bangumi.json"
      },
      {
        "identifier": "foxster-mp4 Repo",
        "sourceURL": "https://raw.githubusercontent.com/foxster-mp4/altsource/master/apps.json"
      }     
    ]
  }

body = JSON.stringify(fake)
$done({ body })
