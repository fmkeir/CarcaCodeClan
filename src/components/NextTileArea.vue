<template lang="html">
  <div class="new-tile-container">
    <div class="tile-display">
      <tile :currentTile="tiles[0]"/>
    </div>
    <button @click="discardTile">Discard Tile</button>
  </div>
</template>

<script>
import Tile from './Tile.vue'

export default {
  name: 'NextTileArea',
  props: ["tiles"],
  components: {
    'tile': Tile
  },
  methods: {
    discardTile: function () {
      this.tiles.shift()
    }
  }
}

</script>

<style lang="css" scoped>
.new-tile-container {
  position: fixed;
  left: 60%;
  top: 10%;
  width: 200px;
  height: 200px;
  background-color: lightgrey;
  text-align: center;
}

.new-tile-container button{
  margin: 0 auto;
}

.tile-display{
  margin: 30px auto;
  width: 100px;
  height: 100px;

}

</style>
