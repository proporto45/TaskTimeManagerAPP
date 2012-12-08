{
  rootVisible: false,

  initComponent: function() {
    this.callParent();

    this.on('render', function() {
      this.workspace = Ext.ComponentManager.get(this.workspaceId);
    }, this);

    this.on('itemclick', function(view, r, item, index, e) {
      var component = r.raw.component;
      if (component) this.workspace.loadInTab(component, {newTab: e.hasModifier()});
    });
  },

  onCloseAllTabs: function() {
    this.workspace.closeAllTabs(); // yes, Workspace implements this method
  }
}
