# This has been automatically generated by the script
# ./update.sh.  This should not be changed by hand.
{
  mkDerivation,
  aeson,
  aeson-casing,
  aeson-qq,
  ansi-wl-pprint,
  asn1-encoding,
  asn1-types,
  async,
  attoparsec,
  attoparsec-iso8601,
  auto-update,
  base,
  base16-bytestring,
  base64-bytestring,
  binary,
  byteorder,
  bytestring,
  case-insensitive,
  ci-info,
  conduit,
  connection,
  containers,
  cron,
  cryptonite,
  data-default-class,
  data-has,
  deepseq,
  dependent-map,
  dependent-sum,
  directory,
  either,
  ekg-core,
  ekg-json,
  exceptions,
  fast-logger,
  fetchgit,
  file-embed,
  filepath,
  ghc-heap-view,
  graphql-parser,
  hashable,
  hashable-time,
  haskell-src-meta,
  hedgehog,
  hspec,
  hspec-core,
  hspec-discover,
  hspec-expectations,
  hspec-expectations-lifted,
  hspec-hedgehog,
  hspec-wai,
  hspec-wai-json,
  http-api-data,
  http-client,
  http-client-tls,
  http-conduit,
  http-media,
  http-types,
  immortal,
  insert-ordered-containers,
  jose,
  kan-extensions,
  kriti-lang,
  lens,
  lens-aeson,
  lib,
  libyaml,
  lifted-async,
  lifted-base,
  list-t,
  memory,
  mime-types,
  mmorph,
  monad-control,
  monad-logger,
  monad-loops,
  monad-validate,
  mtl,
  mustache,
  mysql,
  mysql-simple,
  natural-transformation,
  network,
  network-uri,
  odbc,
  openapi3,
  optparse-applicative,
  optparse-generic,
  parsec,
  pem,
  pg-client,
  postgresql-binary,
  postgresql-libpq,
  postgresql-simple,
  pretty-simple,
  process,
  profunctors,
  psqueues,
  QuickCheck,
  quickcheck-instances,
  random,
  regex-tdfa,
  resource-pool,
  resourcet,
  retry,
  safe,
  safe-exceptions,
  scientific,
  semialign,
  semigroups,
  semver,
  shakespeare,
  some,
  split,
  Spock-core,
  stm,
  stm-containers,
  tagged,
  template-haskell,
  text,
  text-builder,
  text-conversions,
  th-lift,
  th-lift-instances,
  these,
  time,
  tls,
  tmp-postgres,
  transformers,
  transformers-base,
  typed-process,
  unix,
  unliftio-core,
  unordered-containers,
  uri-bytestring,
  uri-encode,
  url,
  utf8-string,
  uuid,
  validation,
  vector,
  vector-instances,
  wai,
  wai-extra,
  warp,
  websockets,
  witch,
  wreq,
  x509,
  x509-store,
  x509-system,
  x509-validation,
  yaml,
  zlib,
}:
mkDerivation {
  pname = "graphql-engine";
  version = "1.0.0";
  src = fetchgit {
    url = "https://github.com/hasura/graphql-engine.git";
    sha256 = "1r19qw2wxzmngb6sjpin3dk6i5r491brcb0ir4g8kw9d0ic90hpy";
    rev = "1349e6cdcfdef4b06593b48fe8e2e51b9f9c94e9";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/server; echo source root reset to $sourceRoot";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson
    aeson-casing
    ansi-wl-pprint
    asn1-encoding
    asn1-types
    async
    attoparsec
    attoparsec-iso8601
    auto-update
    base
    base16-bytestring
    base64-bytestring
    binary
    byteorder
    bytestring
    case-insensitive
    ci-info
    connection
    containers
    cron
    cryptonite
    data-default-class
    data-has
    deepseq
    dependent-map
    dependent-sum
    directory
    either
    ekg-core
    ekg-json
    exceptions
    fast-logger
    file-embed
    filepath
    ghc-heap-view
    graphql-parser
    hashable
    hashable-time
    http-api-data
    http-client
    http-client-tls
    http-conduit
    http-media
    http-types
    immortal
    insert-ordered-containers
    jose
    kan-extensions
    kriti-lang
    lens
    lens-aeson
    lifted-async
    lifted-base
    list-t
    memory
    mime-types
    mmorph
    monad-control
    monad-loops
    monad-validate
    mtl
    mustache
    mysql
    mysql-simple
    network
    network-uri
    odbc
    openapi3
    optparse-applicative
    optparse-generic
    parsec
    pem
    pg-client
    postgresql-binary
    postgresql-libpq
    pretty-simple
    process
    profunctors
    psqueues
    QuickCheck
    quickcheck-instances
    random
    regex-tdfa
    resource-pool
    retry
    safe-exceptions
    scientific
    semialign
    semigroups
    semver
    shakespeare
    some
    split
    Spock-core
    stm
    stm-containers
    tagged
    template-haskell
    text
    text-builder
    text-conversions
    these
    time
    tls
    transformers
    transformers-base
    unix
    unordered-containers
    uri-bytestring
    uri-encode
    url
    utf8-string
    uuid
    validation
    vector
    vector-instances
    wai
    warp
    websockets
    witch
    wreq
    x509
    x509-store
    x509-system
    x509-validation
    yaml
    zlib
  ];
  executableHaskellDepends = [
    base
    bytestring
    ekg-core
    kan-extensions
    pg-client
    text
    text-conversions
    time
    unix
  ];
  testHaskellDepends = [
    aeson
    aeson-casing
    aeson-qq
    async
    base
    bytestring
    case-insensitive
    conduit
    containers
    cron
    dependent-map
    dependent-sum
    ekg-core
    exceptions
    graphql-parser
    haskell-src-meta
    hedgehog
    hspec
    hspec-core
    hspec-discover
    hspec-expectations
    hspec-expectations-lifted
    hspec-hedgehog
    hspec-wai
    hspec-wai-json
    http-client
    http-client-tls
    http-conduit
    http-types
    insert-ordered-containers
    jose
    kan-extensions
    lens
    lens-aeson
    libyaml
    lifted-base
    mmorph
    monad-control
    monad-logger
    mtl
    mysql
    mysql-simple
    natural-transformation
    network
    network-uri
    odbc
    optparse-applicative
    parsec
    pg-client
    postgresql-libpq
    postgresql-simple
    process
    QuickCheck
    resource-pool
    resourcet
    safe
    safe-exceptions
    scientific
    shakespeare
    split
    Spock-core
    stm
    template-haskell
    text
    text-conversions
    th-lift
    th-lift-instances
    time
    tmp-postgres
    transformers
    transformers-base
    typed-process
    unix
    unliftio-core
    unordered-containers
    utf8-string
    vector
    wai
    wai-extra
    warp
    websockets
    yaml
  ];
  testToolDepends = [ hspec-discover ];
  doCheck = false;
  homepage = "https://www.hasura.io";
  description = "GraphQL API over Postgres";
  license = lib.licenses.asl20;
  maintainers = with lib.maintainers; [ lassulus ];

  # Needs to be updated for aeson-2.0
  # https://github.com/hasura/graphql-engine/issues/8369
  hydraPlatforms = lib.platforms.none;
  broken = true;
}
