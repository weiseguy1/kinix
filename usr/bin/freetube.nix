{ pkgs, ... }:

{
  programs.freetube = {
    enable = true;
    package = pkgs.freetube;
    settings = {
      defaultQuality            = "1080";
      allowDashAv1Formats       = true;
      hidePopularVideos         = true;
      hideTrendingVideos        = true;
      hideComments              = true;
      hideLiveChat              = true;
      hideCommentLikes          = true;
      hideVideoLikesAndDislikes = true;
    };
  };
}
