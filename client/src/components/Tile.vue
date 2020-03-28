<template>
  <div id="app">
    <img v-if="currentTile" id="myimage" :src="currentTile.imageURL" @click="rotateImage" draggable="true" @dragstart="drag"/>
  </div>
</template>
<script>

export default {
  name: 'Tile',
  props: ['currentTile'],
  methods: {
    rotateImage: function () {
       let img = document.getElementById('myimage');
       img.style.transform = `rotate(${this.imgRotation += 90}deg)`;
       this.currentTile.sides.unshift(this.currentTile.sides.pop());
    },
    drag: function(ev) {
      const draggedTile = {"tile": this.currentTile, "rotation": this.imgRotation}
      const payload = JSON.stringify(draggedTile);
      ev.dataTransfer.setData("text", payload);
    }
  },
  data() {
    return {
      imgRotation: 0,
      sides: ["grass", "road", "grass", "castle"]
    }
  }
}
</script>
<style>
#myimage {
  width:70px;
  height:70px;
  position: absolute;
}
</style>
