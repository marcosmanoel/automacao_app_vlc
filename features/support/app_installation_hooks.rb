require 'calabash-android/management/app_installation'

AfterConfiguration do |config|
  FeatureMemory.feature = nil
end

Before do |scenario|
  scenario = scenario.scenario_outline if scenario.respond_to?(:scenario_outline)
  TEST_APP_PATH="C:/Users/marcos.alves/Desktop/7f3b85706265e718fd03609346f214b2_0.9.0.apk"

  feature = scenario.feature
  if FeatureMemory.feature != feature || ENV['RESET_BETWEEN_SCENARIOS'] == '1'
    if ENV['RESET_BETWEEN_SCENARIOS'] == '1'
      log 'New scenario - reinstalling apps'
    else
      log 'First scenario in feature - reinstalling apps'
    end

    ensure_app_installed
    clear_app_data
    FeatureMemory.feature = feature
    FeatureMemory.invocation = 1
  else
    FeatureMemory.invocation += 1
  end
end

FeatureMemory = Struct.new(:feature, :invocation).new
