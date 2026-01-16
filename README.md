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
natanzinho-lima-cortando-chao-cuiaba-mt?musicid=6392458

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
                {
                    "id": 63925616,
                    "file": "Chance Chanel",
                    "path": "https://web.suamusica.com.br/36466514/4908524/Chance+Chanel.mp3",
                    "isDownloadable": 1,
                    "isExplicit": false,
                    "position": 1,
                    "stream": "https://web-stream.suamusica.com.br/36466514/4908524/stream/Chance+Chanel.m3u8",
                    "isHit": false
                },
                {
                    "id": 63925615,
                    "file": "Um Centímetro part. Juninho Moraes",
                    "path": "https://web.suamusica.com.br/36466514/4908524/Um+Cent%C3%ADmetro+part.+Juninho+Moraes.mp3",
                    "isDownloadable": 1,
                    "isExplicit": false,
                    "position": 2,
                    "stream": "https://web-stream.suamusica.com.br/36466514/4908524/stream/Um+Cent%C3%ADmetro+part.+Juninho+Moraes.m3u8",
                    "isHit": false
                },
                {
                    "id": 63925618,
                    "file": "Fazendo História",
                    "path": "https://web.suamusica.com.br/36466514/4908524/Fazendo+Hist%C3%B3ria.mp3",
                    "isDownloadable": 1,
                    "isExplicit": false,
                    "position": 3,
                    "stream": "https://web-stream.suamusica.com.br/36466514/4908524/stream/Fazendo+Hist%C3%B3ria.m3u8",
                    "isHit": false
                },
                {
                    "id": 63925617,
                    "file": "Estrela",
                    "path": "https://web.suamusica.com.br/36466514/4908524/Estrela.mp3",
                    "isDownloadable": 1,
                    "isExplicit": false,
                    "position": 4,
                    "stream": "https://web-stream.suamusica.com.br/36466514/4908524/stream/Estrela.m3u8",
                    "isHit": false
                },
                {
                    "id": 63925614,
                    "file": "Homem de Família",
                    "path": "https://web.suamusica.com.br/36466514/4908524/Homem+de+Fam%C3%ADlia.mp3",
                    "isDownloadable": 1,
                    "isExplicit": false,
                    "position": 5,
                    "stream": "https://web-stream.suamusica.com.br/36466514/4908524/stream/Homem+de+Fam%C3%ADlia.m3u8",
                    "isHit": false
                },
and for songs this api https://suamusica.com.br/natanzinhoofc/
https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt?musicid=6392458

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
        {
            "@type": "MusicRecording",
            "position": 2,
            "name": "02 - Estrela - Natanzinho Lima",
            "url": "https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt?musicid=63924590",
            "duration": ""
        },
        {
            "@type": "MusicRecording",
            "position": 3,
            "name": "03 - Não Me Perdoei - Natanzinho Lima",
            "url": "https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt?musicid=63924591",
            "duration": ""
        },
        {
            "@type": "MusicRecording",
            "position": 4,
            "name": "04 - Ui Adoro - Natanzinho Lima",
            "url": "https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt?musicid=63924592",
            "duration": ""
        },
        {
            "@type": "MusicRecording",
            "position": 5,
            "name": "05 - Sonho De Amor - Natanzinho Lima",
            "url": "https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt?musicid=63924593",
            "duration": ""
        },
        {
            "@type": "MusicRecording",
            "position": 6,
            "name": "06 - Romântico Anônimo - Natanzinho Lima",
            "url": "https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt?musicid=63924594",
            "duration": ""
        },
        {
            "@type": "MusicRecording",
            "position": 7,
            "name": "07 - Te Quero Pra Mim - Natanzinho Lima",
            "url": "https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt?musicid=63924595",
            "duration": ""
        },
        {
            "@type": "MusicRecording",
            "position": 8,
            "name": "08 - O Que Falta Em Você Sou Eu - Natanzinho Lima",
            "url": "https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt?musicid=63924596",
            "duration": ""
        },
        {
            "@type": "MusicRecording",
            "position": 9,
            "name": "09 - Vou Assumir - Natanzinho Lima",
            "url": "https://suamusica.com.br/natanzinhoofc/natanzinho-lima-cortando-chao-cuiaba-mt?musicid=63924597",
            "duration": ""
        },

I had an idea to get duration via mp3, unfortunately I didn't know any third-party packages so I had to use artificial intelligence but it didn't really help.