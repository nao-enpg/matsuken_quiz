module ApplicationHelper
    def default_meta_tags
      {
        site: '例のサンバを当てるゲーム',
        title: 'Guess the Famous Samba Hit!',
        reverse: true,
        charset: 'utf-8',
        description: 'This is a game where you have to guess a popular song that everyone loves!',
        canonical: request.original_url,
        separator: '|',
        og: {
          site_name: :site,
          title: :title,
          description: :description,
          type: 'website',
          url: request.original_url,
          image: image_url('ogp.png'),
          local: 'ja-JP'
        },
        twitter: {
          card: 'summary_large_image',
          image: image_url('ogp.png')
        }
      }
    end
  end