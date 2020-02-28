<template lang="html">
  <div class="square" @drop="drop" @dragover="allowDrop">
  </div>

</template>

<script>
export default {
  name: 'Square',
  methods: {
    allowDrop: function(ev){
      ev.preventDefault();
    },
    drop: function(ev) {
      ev.preventDefault();
      let data = ev.dataTransfer.getData("text");
      ev.target.appendChild(document.getElementById(data));
    }
  }
}
</script>

<style lang="css" scoped>
.square {
  border: 1px solid black;
  transition: transform .2s;
  background-color: #826848;
}

.square:hover {
  transform: scale(1.5);
  z-index: 1;
}
</style>
