local DataManager = {}
local ifs = require("ifs")

DataManager.emitters = {}

function DataManager:addEmitter(id, emitterData)
  if not id or not emitterData then
    error("addEmitter requires an id and emitterData")
  end
  self.emitters[id] = emitterData
end

function DataManager:updateEmitter(id, newData)
  if self.emitters[id] then
    for key, value in pairs(newData) do
      self.emitters[id][key] = value
    end
  else
    error("Emitter with id " .. tostring(id) .. " does not exist.")
  end
end

function DataManager:removeEmitter(id)
  self.emitters[id] = nil
end

function DataManager:getEmitter(id)
  return self.emitters[id]
end

function DataManager:getAllEmitters()
  return self.emitters
end

function DataManager:clearAll()
  self.emitters = {}
end

return DataManager
