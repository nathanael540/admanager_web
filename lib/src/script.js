function adManagerPluginDisplay(div, adUnit, sizes) {
  sizes = sizes.split("|").map((size) => {
    return size.split("x").map(function (x) {
      return parseInt(x, 10);
    });
  });
  googletag.cmd.push(() => {
    const newSlot = googletag.defineSlot(adUnit, sizes, div);
    newSlot.addService(googletag.pubads());
    googletag.display(div);
  });
}
window.rewardedSlot = null;
window.rewardedSlotReady = null;
function adManagerPluginLoadRewarded(adUnit) {
  googletag.cmd.push(() => {
    window.rewardedSlot = null;
    window.rewardedSlot = googletag.defineOutOfPageSlot(
      adUnit,
      googletag.enums.OutOfPageFormat.REWARDED
    );
    if (!window.rewardedSlot) {
      return;
    }
    window.rewardedSlot.addService(googletag.pubads());
    googletag.enableServices();
    googletag.display(window.rewardedSlot);
  });
}
function adManagerPluginShowRewarded() {
  window.rewardedSlotReady.makeRewardedVisible();
}

if (typeof window.googletag == "undefined") {
  document.body.append(
    document
      .createRange()
      .createContextualFragment(
        '<script async src="https://securepubads.g.doubleclick.net/tag/js/gpt.js"></script>'
      )
  );
}
window.googletag = window.googletag || { cmd: [] };
googletag.cmd.push(() => {
  googletag.pubads().collapseEmptyDivs();
  googletag.pubads().setCentering(true);
  googletag.enableServices();
  googletag.pubads().addEventListener("slotRenderEnded", (event) => {
    window.dispatchEvent(
      new CustomEvent("gam_slot_render", {
        detail: {
          blockId: event.slot.getSlotElementId(),
          isEmpty: event.isEmpty,
          size: event.size,
        },
      })
    );
  });
  googletag.pubads().addEventListener("rewardedSlotReady", (event) => {
    window.rewardedSlotReady = event;
    window.dispatchEvent(new CustomEvent("gam_slot_rewarded_ready", {}));
  });
  googletag.pubads().addEventListener("rewardedSlotClosed", (event) => {
    googletag.destroySlots([window.rewardedSlot]);
    window.dispatchEvent(new CustomEvent("gam_slot_rewarded_closed", {}));
  });
  googletag.pubads().addEventListener("rewardedSlotGranted", (event) => {
    googletag.destroySlots([window.rewardedSlot]);
    var reward = event.payload;
    window.dispatchEvent(
      new CustomEvent("gam_slot_rewarded_granted", {
        detail: {
          blockId: event.slot.getSlotElementId(),
          amount: reward.amount,
          type: event.size,
        },
      })
    );
  });
});
