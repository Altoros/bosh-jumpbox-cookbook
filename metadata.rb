name             'bosh-jumpbox'
maintainer       'Andrei Krasnitski'
maintainer_email 'xaaabk@gmail.com'
license          'Apache 2.0'
description      'Configure BOSH Jumpbox'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
issues_url       'https://github.com/Infra-Red/bosh-jumpbox/issues'
source_ur        'https://github.com/Infra-Red/bosh-jumpbox'

depends 'apt'
depends 'ark'
depends 'golang'

supports 'ubuntu', '>= 16.04'
