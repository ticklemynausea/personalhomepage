require "jekyll-import";

JekyllImport::Importers::WordPress.run({
  "dbname"         => "wp",
  "user"           => "wp",
  "password"       => "wp",
  "host"           => "localhost",
  "port"           => "3306",
  "table_prefix"   => "wp_",
  "site_prefix"    => "",
  "clean_entities" => true,
  "comments"       => true,
  "categories"     => true,
  "tags"           => true,
  "more_excerpt"   => true,
  "more_anchor"    => true,
  "extension"      => "html",
  "status"         => ["publish"]
})
