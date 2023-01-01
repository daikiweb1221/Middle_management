module ApplicationHelper
  def default_meta_tags
    {
      site: 'Middle Management',
      title: 'Middle Management',
      # reverse: true,
      charset: 'utf-8',
      description: '「人に信頼される」 「人に動いてもらえる」そんな上司とは。 このアプリは「部下に信頼されたい」 「部下の心を動かしたい」などの影響力を持ちたい中間管理職のみなさまへ 自身の日々の立ち振る舞いや行動を見える化し「理想とする自分」へと導くサービスです。',
      keywords: 'マネジメント,Management, 中間管理職, 人を動かす, 信頼, 幸福度,立ち振る舞い,コミュニケーション,見える化,上司,部下,関係構築,人に動いてもらう,理想',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.jpg'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image'
      }
    }
  end
end
