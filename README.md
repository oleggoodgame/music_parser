# music_parser
Parsed the following urls:
https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt
https://suamusica.com.br/milsinhotoquedez/toque-dez-na-maxima
https://suamusica.com.br/djwagnerdigitalY/passadao-saudade-altomotivo-dj-wagner-digital-2026

I had the task to write a simple flutter app.

to parse playlists from urls like:
https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt

for each playlist to output playlist name, avatar, description
for each song to display:
Song name, Artist name, Album name, Duration

However, this site does not have a description in playlists, so I took likes, and duration was hard to get, I'll explain why 
At first I thought to do it through the html package and parse everything, but during Chrome DevTools in Network I found an API https://suamusica.com.br/_next/data/webid-1111/pt-BR/milsinhotoquedez/toque-dez-na-maxima.json
I got this:


 "album": {
            "id": 4908524,
            "imageExt": ".jpeg",
            "sendDate": "2025-12-03 14:44:03",
            "size": 142093430,
            "likes": 0,
            "ownerId": 36466514,
            "userName": "milsinhotoquedez",
            "name": "TOQUE DEZ",
            "file": "Toque Dez - Na Maxima.zip",
            "downloads": 242056,
            "released": 1,
            "isScheduled": false,
            "plays": 7681556,
            "slug": "toque-dez-na-maxima",
            "catId": 1,
            "catName": "Arrocha",
            "levelVip": 3,
            "isVip": true,
            "cover": "https://images.suamusica.com.br/P2DlS2yINWoowTGFGPI-e88mfVA=/240x240/filters:format(webp)/36466514/4908524/cd_cover.jpeg?1",
            "bigCover": "https://images.suamusica.com.br/PeDOpYkvJsFYjs-TFoKK18m02yw=/500x500/filters:format(webp)/36466514/4908524/cd_cover.jpeg?1",
            "title": "Toque Dez - Na Máxima",
            "files": [
                {
                    "id": 63925613,
                    "file": "Sua Vez de Terminar",
                    "path": "https://web.suamusica.com.br/36466514/4908524/Sua+Vez+de+Terminar.mp3",
                    "isDownloadable": 1,
                    "isExplicit": false,
                    "position": 0,
                    "stream": "https://web-stream.suamusica.com.br/36466514/4908524/stream/Sua+Vez+de+Terminar.m3u8",
                    "isHit": false
                },
               
and for songs this api https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt?musicid=6392458

"@context": "https://schema.org",
    "@type": "MusicAlbum",
    "name": "Natanzinho Lima",
    "url": "https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt",
    "image": "https://images.suamusica.com.br/X88RB6O6gwDE5Zl9l1rI6xX2Wp8=/500x500/filters:format(webp)/40257667/4908434/cd_cover.jpeg",
    "dateCreated": "2025-12-03 13:45:00",
    "byArtist": {
        "@type": "MusicGroup",
        "name": "Natanzinho Lima",
        "url": "https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt"
    },
    "track": [
        {
            "@type": "MusicRecording",
            "position": 1,
            "name": "01 - Vou Pagar Pra Ver - Natanzinho Lima",
            "url": "https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt?musicid=63924589",
            "duration": ""
        },
        

I had an idea to get duration via mp3, unfortunately I didn't know any third-party packages so I had to use artificial intelligence but it didn't really help.

Photos:
<img width="387" height="742" alt="image" src="https://github.com/user-attachments/assets/04299125-7368-4524-9284-f58862e645dc" />

<img width="392" height="744" alt="image" src="https://github.com/user-attachments/assets/1b97c407-d3fb-40f4-a258-a84027989d51" />
