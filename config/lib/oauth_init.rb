FACEBOOK = YAML::load_file(Rails.root.join("config", "oauth.yml"))["facebook"].
  inject({}){ |memo, (k,v)| memo[k.to_sym] = v; memo}
