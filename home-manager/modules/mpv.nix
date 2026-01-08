{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      mpris
      sponsorblock
    ];
    
    config = {
      # temporary fix for mpv enabling hdr in fullscreen mode
      # if HDR is on, it causes everything to look dull. 
      target-colorspace-hint-mode= "source";
      # perfect settings for framework laptop
      contrast = "-25";
      brightness = "4"; 
      profile = "high-quality";
      ytdl-format = "bestvideo+bestaudio";
      cache-default = 4000000;
    };
  };
}
