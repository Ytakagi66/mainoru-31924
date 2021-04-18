class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @shrines = Shrine.where(user_id: @user.id).page(params[:page]).per(10)
    @temples = Temple.where(user_id: @user.id).page(params[:page]).per(10)
    gon.shrines = @shrines
    gon.temples = @temples
    gon.shrine_festival = shrine_festival
    gon.shrine_goshuin = shrine_goshuin
    gon.shrine_history = shrine_history
    gon.shrine_build = shrine_build
    gon.shrine_nature = shrine_nature
    gon.temple_festival = temple_festival
    gon.temple_goshuin = temple_goshuin
    gon.temple_history = temple_history
    gon.temple_build = temple_build
    gon.temple_nature = temple_nature
    @shrinesArray = @shrines + @shrineFestivals + @shrineGoshuins + @shrineHistories + @shrineNatures + @shrineBuilds
    @shrinesArray.uniq!
    @templesArray = @temples + @templeFestivals + @templeGoshuins + @templeHistories + @templeNatures + @templeBuilds
    @templesArray.uniq!
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :birthday, :prefecture_id, :self_info, :favorite, :avatar, :backimage)
  end

  def shrine_festival
    @festival = Festival.where(user_id: @user.id)
    @festival.map{|festival|
      @festival_num = festival.id
    }
    @festivals = ShrineFestival.where(festival_id: @festival_num)
    @festivals.map{|festivals|
      @festivals_num = festivals.shrine_id
    }
    @shrineFestivals = Shrine.where(id: @festivals_num)
  end

  def shrine_goshuin
    @goshuin = Goshuin.where(user_id: @user.id)
    @goshuin.map{|goshuin|
      @goshuin_num = goshuin.id
    }
    @goshuins = ShrineGoshuin.where(goshuin_id: @goshuin_num)
    @goshuins.map{|goshuins|
      @goshuins_num = goshuins.shrine_id
    }
    @shrineGoshuins = Shrine.where(id: @goshuins_num)
  end

  def shrine_history
    @history = History.where(user_id: @user.id)
    @history.map{|history|
      @history_num = history.id
    }
    @histories = ShrineHistory.where(history_id: @history_num)
    @histories.map{|histories|
      @histories_num = histories.shrine_id
    }
    @shrineHistories = Shrine.where(id: @histories_num)
  end

  def shrine_build
    @build = Build.where(user_id: @user.id)
    @build.map{|build|
      @build_num = build.id
    }
    @builds = ShrineBuild.where(build_id: @build_num)
    @builds.map{|builds|
      @builds_num = builds.shrine_id
    }
    @shrineBuilds = Shrine.where(id: @builds_num)
  end

  def shrine_nature
    @nature = Nature.where(user_id: @user.id)
    @nature.map{|nature|
      @nature_num = nature.id
    }
    @natures = ShrineNature.where(nature_id: @nature_num)
    @natures.map{|natures|
      @natures_num = natures.shrine_id
    }
    @shrineNatures = Shrine.where(id: @natures_num)
  end

  def temple_festival
    @tfestival = Festival.where(user_id: @user.id)
    @tfestival.map{|festival|
      @festival_num = festival.id
    }
    @festivals = TempleFestival.where(festival_id: @festival_num)
    @festivals.map{|festivals|
      @festivals_num = festivals.temple_id
    }
    @templeFestivals = Temple.where(id: @festivals_num).distinct
  end

  def temple_goshuin
    @tgoshuin = Goshuin.where(user_id: @user.id)
    @tgoshuin.map{|goshuin|
      @goshuin_num = goshuin.id
    }
    @goshuins = TempleGoshuin.where(goshuin_id: @goshuin_num)
    @goshuins.map{|goshuins|
      @goshuins_num = goshuins.temple_id
    }
    @templeGoshuins = Temple.where(id: @goshuins_num).distinct
  end

  def temple_history
    @thistory = History.where(user_id: @user.id)
    @thistory.map{|history|
      @history_num = history.id
    }
    @histories = TempleHistory.where(history_id: @history_num)
    @histories.map{|histories|
      @histories_num = histories.temple_id
    }
    @templeHistories = Temple.where(id: @histories_num).distinct
  end

  def temple_build
    @tbuild = Build.where(user_id: @user.id)
    @tbuild.map{|build|
      @build_num = build.id
    }
    @builds = TempleBuild.where(build_id: @build_num)
    @builds.map{|builds|
      @builds_num = builds.temple_id
    }
    @templeBuilds = Temple.where(id: @builds_num).distinct
  end

  def temple_nature
    @tnature = Nature.where(user_id: @user.id)
    @tnature.map{|nature|
      @nature_num = nature.id
    }
    @natures = TempleNature.where(nature_id: @nature_num)
    @natures.map{|natures|
      @natures_num = natures.temple_id
    }
    @templeNatures = Temple.where(id: @natures_num).distinct
  end  
end

