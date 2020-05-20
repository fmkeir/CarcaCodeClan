<template lang="html">
  <div class="new-tile-container">
    <p>Next Tile</p>
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
  width: 20vh;
  height: 20vh;
  background-color: lightgrey;
  text-align: center;
  margin: 5vh auto;
  padding: 1vh;
}

p {
  font-size: 4vh;
}

.new-tile-container button{
  margin: 0 auto;
  font-size: 3vh;
  border: none;
  background: none;
  font-family: Luminari;
}

.tile-display{
  margin: 1vh auto;
  width: 9vh;
  height: 9vh;

}

</style>
