{pkgs, ...}: {
  programs.firefox = {
    enable = true;

    # If you had custom policies/profiles in your old config,
    # paste them here!
    profiles.default = {
      isDefault = true;
      name = "espdesign";
      settings = {
        # Performance & UI
        "browser.startup.homepage" = "about:blank";
        "browser.uidensity" = 1; # Compact Mode
        "browser.tabs.inTitlebar" = 1;

        # Privacy / Annoyances
        "privacy.trackingprotection.enabled" = true;
        "dom.security.https_only_mode" = true;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.aboutConfig.showWarning" = false;
        "extensions.pocket.enabled" = false; # Disable Pocket
        "identity.fxaccounts.enabled" = false; # Disable Firefox Sync (optional)
      };
    };
  };
}
