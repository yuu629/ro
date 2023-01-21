const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
environment.plugins.append('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery',
        Popper: ['popper.js', 'default']
    })
)

environment.toWebpackConfig().merge({
    resolve: {
        alias: {
            'jquery': 'jquery/src/jquery'
        }
    }
});
