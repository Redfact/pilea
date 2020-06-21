//= require vue

new Vue({
  el: '#navbar',
  data: {
    open: false,
  },
  methods: {
    toggle() {
      this.open = !this.open
    }
  }
})