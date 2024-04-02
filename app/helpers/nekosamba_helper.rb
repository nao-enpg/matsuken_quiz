# app/helpers/nekosamba_helper.rb
module NekosambaHelper
    def nekosamba_show_result_meta_tags
      default_meta_tags.deep_merge({
        og: {
          image: image_url('nekoogp.png')
        },
        twitter: {
          image: image_url('nekoogp.png')
        }
      })
    end
  end