local addons_list = require("addons/addons-list")

for name, addon in pairs(addons_list) do
  if data.raw["string-setting"]["zk-lib_" .. name] then
    data:extend({{
      type = "string-setting",
      name = "zk-lib-during-game_" .. name,
      setting_type = "runtime-global",
      default_value = "enabled",
      allowed_values = {"disabled", "enabled"},
      localised_name = {"mod-name." .. name},
      localised_description = {"mod-description." .. name}
    }})
    if addon.have_settings then
      require("addons/settings/" .. name)
    end
  end
end
