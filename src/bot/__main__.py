from .server import run
from .server import ReCaptchaRequestHandler


run(handler_class=ReCaptchaRequestHandler)