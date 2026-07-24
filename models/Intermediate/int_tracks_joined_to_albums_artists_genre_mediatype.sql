with tracks as (
    select * from {{ ref('stg_music__tracks') }}
),

media_types as (
    select * from {{ ref('stg_music__media_types') }}
),

genres as (
    Select * from {{ ref('stg_music__genres') }}
),

artists as (
    select * from {{ ref('stg_music__artists') }}
),

albums as (
    Select * from {{ ref('stg_music__albums') }}
),

joined as (
    select 
        tracks.track_id,
        tracks.album_id,
        tracks.mediatype_id,
        tracks.genre_id,
        tracks.track_name,
        tracks.track_composer,
        albums.album_title,
        artists.artist_name,
        media_types.mediatype_name,
        genres.genre_name,
        tracks.track_length_ms,
        tracks.track_length_seconds,
        tracks.track_length_mins,
        tracks.bytes,
        tracks.unit_price
    from tracks
    left join genres
        on tracks.genre_id = genres.genre_id
    left join media_types
        on tracks.mediatype_id = media_types.mediatype_id
    left join albums
        on albums.album_id = tracks.album_id
    left join artists
        on artists.artist_id = albums.artist_id
)

select * from joined;