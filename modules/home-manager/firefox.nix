{pkgs, ...}: {
  programs.firefox = {
    enable = true;

    # If you had custom policies/profiles in your old config,
    # paste them here!
    profiles.default = {
      isDefault = true;
      settings = {
        "browser.startup.homepage" = "about:blank";
        "browser.search.region" = "US";
      };
    };
  };
}
