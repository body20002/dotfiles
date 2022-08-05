from libqtile import widget


class Mpd2Imporved(widget.Mpd2):
    def formatter(self, status, current_song):
        formatted = super().formatter(status, current_song)

        if len(formatted) < self.width // 8:  # one character is approximately 8 pixels
            formatted = "{:<{width}}".format(formatted, width=(self.width // 8))
            self._is_scrolling = False
            self._should_scroll = False
        else:
            self.scroll = True

        return formatted
