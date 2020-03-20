<template lang="html">
  <div class="new-tile-container">
    <div class="tile-display">
      <tile :currentTile="tiles[0]"/>
    </div>
  </div>
</template>

<script>
import Tile from './Tile.vue'

export default {
  name: 'NextTileArea',
  props: ["tiles"],
  components: {
    'tile': Tile
  }

}


</script>

<style lang="css" scoped>
.new-tile-container {
  position: fixed;
  left: 50%;
  top: 10%;
  width: 500px;
  height: 500px;
  background-color: lightgrey;
}

.tile-display{
  margin: 30px auto;
  width: 200px;
  height: 200px;

}

</style>
