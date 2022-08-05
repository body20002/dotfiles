from typing import Any

from libqtile import widget


# Don't use: not working :/
class Mpris2Improved(widget.Mpris2):
    def parse_message(
        self,
        _interface_name: str,
        changed_properties: dict[str, Any],
        _invalidated_properties: list[str],
    ) -> None:
        super().parse_message(_interface_name, changed_properties, _invalidated_properties)

        if len(self.displaytext) < self.width // 8:  # one character is approximately 8 pixels
            self.displaytext = "{:<{width}}".format(self.displaytext, width=self.width // 8)

        if self.text != self.displaytext:
            self.update(self.displaytext)
