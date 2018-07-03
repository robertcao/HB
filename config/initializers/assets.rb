# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w(bootstrap.min.css metisMenu.min.css sb-admin-2.css morris.css dataTables.bootstrap4.min.css dataTables.responsive.css jquery.min.js bootstrap.min.js metisMenu.min.js morris.min.js morris-data.js raphael.min.js sb-admin-2.js jquery.dataTables.min.js dataTables.bootstrap.min.js dataTables.responsive.js )


