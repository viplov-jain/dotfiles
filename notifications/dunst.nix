{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dunst
    libnotify
  ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "Hack Nerd Font";
        frame_color = "#89b4fa";
        separator_color = "frame";
        corner_radius = 5;

        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
      };

      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };

      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };

      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#fab387";
      };
    };
  };
}
